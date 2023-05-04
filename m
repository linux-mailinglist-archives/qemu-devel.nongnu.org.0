Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB816F68CC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:03:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVnG-0008Uz-7y; Thu, 04 May 2023 06:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puVnA-0008RQ-VC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puVn8-00026P-CN
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683194545;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RysFMeIH/uVFBuzctJJGVBtnBF2j6kEUeSt742m+j5I=;
 b=NpuMu2igoYcZMViW45jIntz0wmEeNBKoMWtWJZ6bmTHbWPbUuZjf3NeXK9lpfa71okYMKO
 JpkmDG6dMfnVn/ZGXySmlVVwFUL1sfQak9HbpGToJRooh8JLB1u6lGEK54ef3F6Bczyn88
 Q/daLiSBZfWZbsnmwUKKn7AS6F5Y4lI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-8-ioohBPOSaINQ5lGw50TQ-1; Thu, 04 May 2023 06:02:23 -0400
X-MC-Unique: 8-ioohBPOSaINQ5lGw50TQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f16ef3be6eso1685295e9.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 03:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683194542; x=1685786542;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RysFMeIH/uVFBuzctJJGVBtnBF2j6kEUeSt742m+j5I=;
 b=K8ppKGhfDAU90pv7QzhNak/UXTwA8y7WQ0Y+QJo3enNaaWzWjjo9qxxiUkMWd1qH2k
 PmJFgckcfgFBDuqc85znU+W8crizhkOT2dq1W0ztUyNoYAzZjBg4sdD6sG38p6sj8SEy
 SmXJPjn/ZSUmRMt2Pa9uJOawUguBo3v5NvuRbiaSZ1D2OflkXXnkoLw774FJr2PRhel3
 8vT8n9Ev1N9Ts3BYFReV9+yE194ch8Wj65y0XSP3nInui3NP5BOlqVxuLfIe186aYXdX
 o8zvpGZGnTrGqM00sz1F4b51C2IPlt0LfRHGtykwQCPjOIivAvgJGzyZXV6GAVas/Z4f
 i+cw==
X-Gm-Message-State: AC+VfDzbPRUY4ErZyxyTatsPWd08bi6wrG+F3qlxpQqNQRNvC3+yo+Pl
 LwzNI1L2ZM4kTiKRzkhws7nLWAgg0qmqKhGf3l7PRAEsH828qi2cDDm28xuE+mWsiSubDh8fWxM
 linwG6AM3cPg82j4=
X-Received: by 2002:a05:600c:2309:b0:3f3:1fa6:d2c4 with SMTP id
 9-20020a05600c230900b003f31fa6d2c4mr15976617wmo.24.1683194541987; 
 Thu, 04 May 2023 03:02:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+wnUvL6kygZk0pE8tB+i2GIztkdLGfKRQP+Z/naDev28CCsSRVC3iwceq5qITlwjaU32yYw==
X-Received: by 2002:a05:600c:2309:b0:3f3:1fa6:d2c4 with SMTP id
 9-20020a05600c230900b003f31fa6d2c4mr15976588wmo.24.1683194541628; 
 Thu, 04 May 2023 03:02:21 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 f23-20020a7bcd17000000b003ee443bf0c7sm4337180wmj.16.2023.05.04.03.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 03:02:20 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,  Peter Xu <peterx@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Yanan Wang <wangyanan55@huawei.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Eduardo Habkost <eduardo@habkost.net>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PULL 11/18] migration: Create migrate_block_bitmap_mapping()
 function
In-Reply-To: <ZFNu6YsZ/7YbhlQb@redhat.com> (Kevin Wolf's message of "Thu, 4
 May 2023 10:38:01 +0200")
References: <20230427152234.25400-1-quintela@redhat.com>
 <20230427152234.25400-12-quintela@redhat.com>
 <ZFJw1lSMcQ5sqZBD@redhat.com> <87bkj1qqu5.fsf@secure.mitica>
 <ZFNu6YsZ/7YbhlQb@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 04 May 2023 12:02:19 +0200
Message-ID: <87y1m4pg7o.fsf@secure.mitica>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Kevin Wolf <kwolf@redhat.com> wrote:
> Am 03.05.2023 um 19:15 hat Juan Quintela geschrieben:
>> Kevin Wolf <kwolf@redhat.com> wrote:
>> > Am 27.04.2023 um 17:22 hat Juan Quintela geschrieben:
>> >> Notice that we changed the test of ->has_block_bitmap_mapping
>> >> for the test that block_bitmap_mapping is not NULL.
>> >> 
>> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> >> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> >> 
>> >> ---
>> >> 
>> >> Make it return const (vladimir)
>> >
>> > (I don't think this part was actually meant for the commit message)
>> 
>> yeap.  My understandig has always been that this is the way to put
>> commenst for the email.
>
> Yes, but this only works if you then actually apply the patch from the
> mail with "git am". Seems you directly cherry-picked your local commit
> instead, so the comment below "---" has now become part of the git
> history.

Oops.  Yeap, I normally rebase my patches on top of upstream.


> We were asked a while ago to always use "git am -m" to include the
> Message-ID header from the email, so applying from the list is what we
> should be doing anyway, even for our own patches.

Oops.

Will do from now on.

Thanks.


