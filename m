Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE4E39BBC7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:25:25 +0200 (CEST)
Received: from localhost ([::1]:48246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBhN-0001Es-2U
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa7-0007qh-HI
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:55 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa5-0008Es-RP
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:55 -0400
Received: by mail-ej1-x630.google.com with SMTP id g20so15137864ejt.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nEr88gMBuvavyMpSy3KEuJq9doTqO0h81BlSUvT2wpg=;
 b=DC+Dk/PmlLRaDaqUaQPMBCaPerQIsf4Jw0xRPU/gPms4D8ltQPVvSS79UxPJ/fkhbP
 s3wbQuSGNiE6ffDuNxxWB9p2/ldebvOJNP1LEU/t779NXZhky9I6YViDdZkmqWiPP87A
 l+wtCqwYyDGR41gDH7PQpUld2BlK6xpONzqzjH6H+J1HPy5X7mxkhhSCjoWpZvv6TMVl
 EpWbl2G10ja2HFA/kDo0pDn5gdUuJCW3XUJOb7lWvcm4ifNF8RNwcqic6fw4SBPBtG13
 10HkDFluNaV994E+t2LactJSUxok29q+aXZWzAT8cK6izwUXCHC1r8CpUFA+Dg6OvzQz
 XLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nEr88gMBuvavyMpSy3KEuJq9doTqO0h81BlSUvT2wpg=;
 b=pNDxvRVFy0lddDXplIvjwQWvX8eOoOVeUw8nv31WKVvByDhQB4zawbkYgbRHrEkT3N
 PDAOdcdrtcCPGQ1HDeETyxzokjaR2TXwB+MBCjUVlkQM/2wLm/ME8wdirLeJPak2yzMk
 KppALBV2LYcG4dX5zvw1e7QBNKLNQOvZHQ/G4XYMmq8sQ9O9vtkRJ7VjcwFArNFQmfFj
 btT83PFAPlgMCYOuzu8IIIxn+ore6nrFjCxXTuqWyJbnOt5QlC1pDLUevKLNBXXfaJef
 tcBTvn4CbpPAjVa9IXmIQWFjZFfqMy4XlyYOY13ClmV8gBCEyPopWG/Ec/QLfj0N/VXf
 qyFg==
X-Gm-Message-State: AOAM531jUWSzjud9HR4TbC/eRrgLOMtpo0ZREG7V3c4JEsmZmc2la641
 2H/VP/FD8WhMNC9joPW+AQiXOzMhQ/RuEQ==
X-Google-Smtp-Source: ABdhPJzLxoMKCDxNK/OEOaq6Vakaw+jEt96b0UnZRuIUClPCHx8U0MSNzLho/NoWnNWs0IOw6z+msg==
X-Received: by 2002:a17:906:a281:: with SMTP id
 i1mr4579252ejz.307.1622819872513; 
 Fri, 04 Jun 2021 08:17:52 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] target/i386: Fix decode of cr8
Date: Fri,  4 Jun 2021 17:17:39 +0200
Message-Id: <20210604151745.310318-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

A recent cleanup did not recognize that there are two ways
to encode cr8: one via the LOCK and the other via REX.

Fixes: 7eff2e7c
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/380
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210602035511.96834-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 834186bcae..a7f5c0c8f2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8091,6 +8091,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 2:
         case 3:
         case 4:
+        case 8:
             break;
         default:
             goto unknown_op;
-- 
2.31.1



