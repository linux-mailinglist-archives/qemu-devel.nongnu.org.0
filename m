Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFCE6F7182
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:50:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoU-00076C-E8; Thu, 04 May 2023 13:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puaO5-0002Kk-21
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:56:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puaO3-0008Qe-IA
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683212210;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8RWno/ip0ojDIBVq1kbkhJr9XbYoZVM2s0ePplaA9Cg=;
 b=H3uz/JmU3adgg/BY/Y9+shA8T1HnAvQUFzATJdbr8Qq7R1jiAc36TFsPaaFVyu8CsEH980
 VWLxWLu3F99na2GFcmznm0AVs0zoC/di9veWWfXAdsnSIiTOp7yecFK0IbPEcVQ1HVoHPP
 Eqyh599fGBtHUK8K5SIH0KTr5WOzduA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-F3_7a723OXKNWP1ifMgWxQ-1; Thu, 04 May 2023 10:56:49 -0400
X-MC-Unique: F3_7a723OXKNWP1ifMgWxQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1754de18cso4083545e9.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683212208; x=1685804208;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8RWno/ip0ojDIBVq1kbkhJr9XbYoZVM2s0ePplaA9Cg=;
 b=La5t7ZZMz3ASKKvi5dnjDBkVoWl6hPYA2TWzXo7HOg1cptijeIfCJI59FeDh5LPu2w
 Wa6CvXDXTVtoSNlzfsBUW6k8DMI6TDpPBvxf9BJbAJW4PeCZxWpQxiZx14kbiIgJ8SiC
 qY/Pczy31TUPUkBXCIThtOXtACLaZr+lWQ2y/yWfGRFBDyS4B1BMVt7rcTrgq9EqP+Cw
 D7j3+KCXeUbp2tYJNM0anCyihJjWf4oPnCW2fOqPcdRFIwtVzMCtTqEIzmP9oef1n9z6
 Q9SPLOz2CVcGMjRrg6KQVSZQKCDx+C9DL8lidwcuM1PDsM9yGRH3+qxqYBrqaPV9Utmp
 ZeDw==
X-Gm-Message-State: AC+VfDyvTnn7XiTQPW0rsul3WnYuNnERqN1Jsi2/SbYLtYwYC2NcfgM6
 bQchw++mLPHK3Pka3F4AgsriJSHKxyrv6TXzC+E6E+mYpoDHFIr7dZLFmkLa8JsX7K1eSIlm24V
 XzvmR4clmt/Udb+U=
X-Received: by 2002:a05:600c:22c9:b0:3f0:46ca:f201 with SMTP id
 9-20020a05600c22c900b003f046caf201mr2590wmg.1.1683212208260; 
 Thu, 04 May 2023 07:56:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xKlOlCi+zZol3QlFswdeuwJHfJHzBSMrPBO0Lj3TAvK0Dv4+Y0RfhKLi8cY35zTJjz2PRWw==
X-Received: by 2002:a05:600c:22c9:b0:3f0:46ca:f201 with SMTP id
 9-20020a05600c22c900b003f046caf201mr2573wmg.1.1683212207948; 
 Thu, 04 May 2023 07:56:47 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 z19-20020a7bc7d3000000b003edef091b17sm5188385wmk.37.2023.05.04.07.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 07:56:47 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Fam Zheng
 <fam@euphon.net>
Subject: Re: [PATCH 0/9] QEMU file cleanups
In-Reply-To: <ZFPFF4MB1j5wNnxe@x1n> (Peter Xu's message of "Thu, 4 May 2023
 10:45:43 -0400")
References: <20230504113841.23130-1-quintela@redhat.com> <ZFPFF4MB1j5wNnxe@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 04 May 2023 16:56:46 +0200
Message-ID: <87ttwsp2kx.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> On Thu, May 04, 2023 at 01:38:32PM +0200, Juan Quintela wrote:
>> - convince and review code to see that everything is uint64_t.
>
> One general question to patches regarding this - what's the major benefit
> of using uint64_t?
>
> It doubles the possible numbers to hold, but it's already 64bits so I don't
> think it matters a lot.

We were checking for negatives even when that can't be.
And we are doing this dance of

int64_t x, y;
uint64_t a, b;

x = a;
b = y;

This is always confusing and not always right.

> The thing is we're removing some code trying to
> detect negative which seems to be still helpful to detect e.g. overflows
> (even though I don't think it'll happen).  I just still think it's good to
> know when overflow happens, and not sure what I missed on benefits of using
> unsigned here.

If you grep through the code, you see that half of the things are
int64_t and the other half is uint64_t.  I find it always confusing.


> I've reviewed all the rest patches and all look good here.

Thanks very much.


