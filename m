Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9304A3F0B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:07:47 +0100 (CET)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESf4-0006wU-QJ
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nESZx-0004eA-Rz
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nESZa-0003Mx-DB
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643619622;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=orOot2lrwexzeLQtb8k0N+ak6H+GPw7vMQbme+7gk/o=;
 b=ERC1cil8xhj6QHI6OrOlHXK4XCiRsluts0o/zs6IspzegMFYpQHUFJF2RDvqA+QA1/dKXC
 stL/KP10ZUb6nN2oeQDm6xsZf8/zQ7pbVjeq+TgTU7F+sauINEVl/3Wq5iQV9CWVvJbzlT
 vSg1uVkwjYJh9BZbmwn4SKFQ6e6Isg0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-nqIKJAFnMQeG_d4FoD7GDQ-1; Mon, 31 Jan 2022 04:00:21 -0500
X-MC-Unique: nqIKJAFnMQeG_d4FoD7GDQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so4554551wrc.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 01:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=orOot2lrwexzeLQtb8k0N+ak6H+GPw7vMQbme+7gk/o=;
 b=P46lxNqj9lTNRHEA6JYRhpxgX4Xi95aSRsepV1dmkSXXx0Yn9WfX2CnqOhLqh1JxRx
 8HtperH5ruLCFlbjbDdllFni3j3ZQiwyLTIlZJLspvbmVuJaM9IqMkmYdDez+CPlDihD
 PlDRYfOuNgxMsppi1acnZ7WAVroAagnbWqc2ic2efCRxYps2C7hRPNRSf9DMC7rFFDEy
 pegabF55QVkAssw5sC89CyVjrmLSNWEiXMPIEb3YW8aIQZf0qeo26xovAKNKDM+LQf+Y
 k2BPeifeWq3iir8qcFBm4OIPzZmgc0CwpWtW6PUfurwhwWpTCBgYjxm1hZzyoERCvuCu
 Lojw==
X-Gm-Message-State: AOAM53183Pd8pp75QRBTYTRjy5Dp0uB0f4eYTdL0H/ZfLz5OCwQj6R7R
 ukq/qZN/e2WbJtm+HNldPM4kIy+2nnKwT/U7VaWfPI0ODrfJsvXHefv8ES4xdzK4IThgV3F+41t
 fv0mHg2S3d172a94=
X-Received: by 2002:a1c:2b01:: with SMTP id r1mr17530069wmr.63.1643619620379; 
 Mon, 31 Jan 2022 01:00:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQNZR0YEtvuN4Y8rEzC9A0bmcbRo3djIo3APvoDBzwvDVDXPieq7n4Dtk1DrOB4B0M8YF9/A==
X-Received: by 2002:a1c:2b01:: with SMTP id r1mr17530050wmr.63.1643619620182; 
 Mon, 31 Jan 2022 01:00:20 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id n10sm13749185wrf.96.2022.01.31.01.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 01:00:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] migration: Perform vmsd structure check during
 tests
In-Reply-To: <YfK+7LCJssDhie9O@work-vm> (David Alan Gilbert's message of "Thu, 
 27 Jan 2022 15:49:00 +0000")
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-4-dgilbert@redhat.com>
 <87ilu6nrqe.fsf@secure.mitica> <YfK+7LCJssDhie9O@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 31 Jan 2022 10:00:18 +0100
Message-ID: <87mtjc8el9.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, lsoaresp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
>> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> >
>> > Perform a check on vmsd structures during test runs in the hope
>> > of catching any missing terminators and other simple screwups.
>> >
>> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> 
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> 
>> queued.
>
> Careful; I think that'll break with slirp until libslirp gets updated
> first.

As expected, it broke it.

I resend the PULL request wihtout that two patches.

Once that we are here, how it is that make check didn't catch this?

Later, Juan.


