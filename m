Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E185B553F5A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:08:18 +0200 (CEST)
Received: from localhost ([::1]:47434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3nur-0007wh-Ec
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3nsS-00078W-7G
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3nsM-0003Gl-1m
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655856340;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04nKuE31zr9zjOqjhqamPILTXYSX5NwV22PTk4Xh57M=;
 b=Taf61yEaP+KNy/fqGgjGx7YbVCCaovqf/0FgTbOG2hn9Y3274n9Urjil6bi93yLZ1nbhlx
 HVqETSxn3dt+yPigELnUfz+XTB5Ha3W+xDrYUGTvSSssKepa1ePUOLkL3BCXnd/WbYeWQR
 aTYDC4Op1HMvJ0LLBciA/KPLwLEwo0E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-DaEzOc82N7OozqBgMPxOAQ-1; Tue, 21 Jun 2022 20:05:38 -0400
X-MC-Unique: DaEzOc82N7OozqBgMPxOAQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k15-20020a7bc40f000000b0039c4b7f7d09so6925943wmi.8
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 17:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=04nKuE31zr9zjOqjhqamPILTXYSX5NwV22PTk4Xh57M=;
 b=gZOJJLRptUZ1pCG0Bh2cWczWXtQUyswfFwWJ9hr5IXMEhzmiR7qrP6E/91LYMC0ASV
 19ZcfotLRUqlG9sbyjwDeVsddRdE7EVModm6lpLbsLWJCASUHajHi9Q0CvLVwhM7hUrc
 vjqxeOHie7G0GUNDtI9C8lfTVYhFPhjvuzvYbu8JS0xdBDgYaZmEYvnjUm0LV3kYRXAz
 wAQ78oWVOQCLDUB6Wx3rPdhEE3wTP1pnIyE6noXcJpKBCY3jH2BtntB0ZIu6Wxz49sc/
 htfg3kaeRcwcAsQ+7AQIkBViwW60auP2Jbacoxy0wyF8pBIYBOZXJx7+tm5budwP6P54
 1LxA==
X-Gm-Message-State: AJIora9irFHz4E3lJ93lDUfDcgFZ3rKkdygUvQg0/M8gP3FfmpSOLiyQ
 56vfV+IcnFKJ5Y+WUR80jB8T4QpaqJP5vl0r36Hvzb/heIHKo1J3GvGNvbdkNmwj+VmaC6JoXp8
 9COiUMQvdQOIYK8E=
X-Received: by 2002:a7b:cb58:0:b0:39e:f121:f7d4 with SMTP id
 v24-20020a7bcb58000000b0039ef121f7d4mr696576wmj.174.1655856337862; 
 Tue, 21 Jun 2022 17:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1s96hRXgK9JLaznf3CKR3wcBByrXMpDtBVAc+OiUiRv//jfJ4ipSbHWBRPCtjMmev7/n4lw==
X-Received: by 2002:a7b:cb58:0:b0:39e:f121:f7d4 with SMTP id
 v24-20020a7bcb58000000b0039ef121f7d4mr696553wmj.174.1655856337647; 
 Tue, 21 Jun 2022 17:05:37 -0700 (PDT)
Received: from localhost (84.125.73.40.dyn.user.ono.com. [84.125.73.40])
 by smtp.gmail.com with ESMTPSA id
 e13-20020adfe7cd000000b0021b89181863sm10124204wrn.41.2022.06.21.17.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 17:05:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  "Daniel P . Berrange" <berrange@redhat.com>,  "Dr
 . David Alan Gilbert" <dgilbert@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v7 02/14] migration: Postcopy preemption preparation on
 channel creation
In-Reply-To: <20220524221151.18225-3-peterx@redhat.com> (Peter Xu's message of
 "Tue, 24 May 2022 18:11:39 -0400")
References: <20220524221151.18225-1-peterx@redhat.com>
 <20220524221151.18225-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 22 Jun 2022 02:05:35 +0200
Message-ID: <87mte5v9yo.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Create a new socket for postcopy to be prepared to send postcopy requested
> pages via this specific channel, so as to not get blocked by precopy page=
s.
>
> A new thread is also created on dest qemu to receive data from this new c=
hannel
> based on the ram_load_postcopy() routine.
>
> The ram_load_postcopy(POSTCOPY) branch and the thread has not started to
> function, and that'll be done in follow up patches.
>
> Cleanup the new sockets on both src/dst QEMUs, meanwhile look after the n=
ew
> thread too to make sure it'll be recycled properly.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


