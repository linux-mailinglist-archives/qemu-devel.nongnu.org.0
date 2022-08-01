Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18F586624
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 10:18:56 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQdb-00064A-8W
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 04:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oIQWc-0000NQ-6N
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oIQWZ-0006ef-Iy
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659341497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=ihoeuupSRme20zwvYGeJx1gUFNCqzJrZJg5gKgqWu9ZcDqTDewouo5vebdgA30B5ySLG7f
 vzevIzDusFpb88ZS2YFpka4rT0TbjTDZX2fmcn3DnEuIC9qrcJAi98ZlMHIPLwfzFAF0Ho
 VTphMz2pjIFYy4o9u9a4OI86Oq3Otb4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-MNFOB7tOMn2u7Dgu0c_RhA-1; Mon, 01 Aug 2022 04:11:28 -0400
X-MC-Unique: MNFOB7tOMn2u7Dgu0c_RhA-1
Received: by mail-ed1-f70.google.com with SMTP id
 h15-20020a056402280f00b0043bd8412fe0so6739367ede.16
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 01:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=hczrcoY2h6f+NrO3fvuDtafYQWlWGbpT7+/sEjnI9Xiwp9VHIWf66sb98R2dcl+wtF
 dxoyZW5KVN9O40iyfA3U1W8Hnfd85HV35HMO7V0cypFxw6FeyZ2SFpIiAUzKg+ubCiUx
 103i8sO5JF5aDURYknpph2W64AV3ygTPkrQDJgUE/nZAPM24G5u0I/+TBvE/16zzuWmg
 zJiMLaEVc1biMOULn8/ySXr+XPyhtZu9nR5lUNnQ0VWJ6Il8JnnPtN2hHVJkAYX2FBOg
 O69n76ZFpaK++aWgioR9gtWAO/qkwVltAN2dImVWbqUpWeabUD/yjuH7Z33cMQA98s3T
 mz4Q==
X-Gm-Message-State: AJIora8MxpeIZLDekIf1GyLvtp+LoYWMHU812kqMnOJglp3/j/dr5zcr
 oTqoXWLdj7ZNzlHGYM3dga5Ed7nVWPcLQN0HB8d23ehuCD0puB3yItVa3giXLRCimO4otFGTybN
 9zSfoW/rRs4QDD60=
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id
 b10-20020a056402084a00b00423fe998c53mr15009204edz.195.1659341487699; 
 Mon, 01 Aug 2022 01:11:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vekjqA3bl/Muy67ADWy0MZnILq5aw5hS5lg8ltxdkJhio1Jeavu5x7QfXFw5LLSyAAcT8trw==
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id
 b10-20020a056402084a00b00423fe998c53mr15009185edz.195.1659341487532; 
 Mon, 01 Aug 2022 01:11:27 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090626ca00b007262b7afa05sm4869240ejc.213.2022.08.01.01.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 01:11:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: pbonzini@redhat.com, fam@euphon.net, alxndr@bu.edu, qemu-devel@nongnu.org
Subject: Re: [PATCH for-7.1 0/2] scsi-disk: fixes for block size crashes found
 by fuzzer
Date: Mon,  1 Aug 2022 10:11:26 +0200
Message-Id: <20220801081126.15503-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220730122656.253448-1-mark.cave-ayland@ilande.co.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



