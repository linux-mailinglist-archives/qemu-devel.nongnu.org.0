Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB744EECAC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:58:38 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFvJ-0007cZ-4H
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:58:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naFuJ-0006ut-Um
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:57:35 -0400
Received: from [2a00:1450:4864:20::62e] (port=35528
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naFuI-0000bY-CA
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:57:35 -0400
Received: by mail-ej1-x62e.google.com with SMTP id yy13so5393542ejb.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=HYVbTRwwPARPqPJaju1xCS6pGCuxn+bgjkKIOdTaZWW4AFPjXIaAdbVlbQWzkoYJAx
 vAMmu5FarDTEpntiNYR25dHIFPKm9GCxA18UBMwfbYqughWCwH4N6vbL/az2RfChlf9+
 PX3OfVKkWeiLgO/fS1j2dDrzfwFVnX/DRmldPJdqjtR+SVBIJJlin13NjTy40B9mwWop
 hOV/V27vyspFEPvo6yprbMM6L5QUaOA7DgpE0sLykwEVIxCc+lOFDZLLQ4Aqzrc6pzEh
 CE9AEcfEwCTxUv8nk+CSiEeTCBWsrT37ZaGixA49HZCTe57Z7AFYOIr2fbM1aOYj0EbA
 Y1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=m2r1OlQ/ZAFirL6SEwFkL5Ri2f2ctZB8zRUGLGqBtnfnX9UI0voxMEB8CfscP/Rv98
 E0CJYXiqk0o4fs+lhqLUCFeOq56HTFZ3ku4/Pkx/YAQhKXI7fRMSTC9hmE6orFhVQ276
 t30Oft+HOcj1aVygN/vtRZqfSyi2ktT4fi9c+evsyU9K4Ljgr2NpSVyDgsmLGj6deBmk
 Fg//tOMuy1sok6KRcCWcLhlIQ0dUbEkGFTuYf/6vQSm2vPFXlMabZ8wDOfhzG1r9UOWj
 gOZ+RmO9u7cMlmmQftlXvGAYS2lX8OaigKeKgw/kvYl9IUOKCSxojniX+05KiMSJqpZG
 fIpw==
X-Gm-Message-State: AOAM530Idb9qDf/IcF0at4gvSZdefYocBbEq5DF/b7CNxRW6nMS8lTPW
 iVmct6Gx7w+57zqYxQBdlIQ=
X-Google-Smtp-Source: ABdhPJz8IzKoWefqY0D8K77vdm/C1on6RofSpIyfOpqpwFbO7olfrVhHZKF3cPvW8BxN8nn+yvlfNg==
X-Received: by 2002:a17:907:3e1a:b0:6e0:5ba8:8e0f with SMTP id
 hp26-20020a1709073e1a00b006e05ba88e0fmr8771122ejc.581.1648814252656; 
 Fri, 01 Apr 2022 04:57:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 tc19-20020a1709078d1300b006e0649189b0sm919135ejc.68.2022.04.01.04.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 04:57:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] build-sys: simplify AF_VSOCK check
Date: Fri,  1 Apr 2022 13:57:30 +0200
Message-Id: <20220401115730.1224937-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401115005.2204000-1-marcandre.lureau@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



