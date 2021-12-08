Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C946CE8F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:54:56 +0100 (CET)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murmx-00055b-68
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1murlO-000429-Eh
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:53:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1murlM-0006xN-Ed
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638949995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58zKxeuGCCH+c0u34p/x1cecyAPOmwgEnxFPsQ07gkg=;
 b=LLT8qjAyXkZf1sB0TK9t99KrZaiBRwUNS0/K4j80w8rD3WPRLeFa0TzbUJ3MJtpZRBgSfe
 zwS55wjieJKT3OImCi5kbhtMBGqfZlWQLtB8ICG86cVzAzRiQWTL5mtXbyYNC+0u5O7MdA
 jf3XvUIemEj/bb/gtJuYsNUk0E9g9t0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-6ui2FPzENcqS6STPAl6QnA-1; Wed, 08 Dec 2021 02:53:12 -0500
X-MC-Unique: 6ui2FPzENcqS6STPAl6QnA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y141-20020a1c7d93000000b0033c2ae3583fso883652wmc.5
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=58zKxeuGCCH+c0u34p/x1cecyAPOmwgEnxFPsQ07gkg=;
 b=IyIfYBSfA+SeJZ8cuanzNu1BI+2tcaBxRlADw5Pa2whbHpbf/M7CoTk52BVrwNIl2A
 amMdA/9vTuhPwn8TZyb56Bd1OvfPe8UXAI5cdMaHkSARoHs6aOn+tVIi/vuZ55ULJqYL
 nX9IOu5uIEYDcalL1TthKahqBJ9IG8lk9lFDAAogFmUorQE1a88EmqeNTmVyPFqXvYzK
 zeJC0314Ty/3J6gZHQ/RF+sJwiyFayrra0BkuEOytuNFrCCE6SH8e/FXfFnduDbqudJm
 vLgtB9712XqPN1kNj/cgf3iMng2oWYYcpRGgtI2YQYaNXtYIqPI3AIBrkcq0YTByUiG0
 Et5w==
X-Gm-Message-State: AOAM5324rX2wm0QnzYQw7UPqvr1LZiga1OLJ5p3lW3XYES2mXqYyoHff
 woy+TUuQ60DbhlI+FSa+pVMDvlC0N2gS+KiO+IcnwtXgMhiId8owQnVoKr8ZI5cTVUsx0q/rObt
 0xCqdpHZXA2n9Crw=
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr58350098wrr.143.1638949991214; 
 Tue, 07 Dec 2021 23:53:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK4P6+bvbuHoSGsA86a3Z+CNJCxBZQvFpal0hML5slbEimdikOU7T+DBomJqoQMNEDtw2GrA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr58350074wrr.143.1638949991034; 
 Tue, 07 Dec 2021 23:53:11 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g13sm2728756wrd.57.2021.12.07.23.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 23:53:10 -0800 (PST)
Message-ID: <a225ba4a-f23c-25a6-3147-84f8beadddfd@redhat.com>
Date: Wed, 8 Dec 2021 08:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 5/6] test/libqtest: add some virtio-net failover
 migration cancelling tests
From: Thomas Huth <thuth@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-6-lvivier@redhat.com>
 <20211208024325-mutt-send-email-mst@kernel.org>
 <29fbcb88-ab07-26d7-5c81-5ed21baf40c9@redhat.com>
In-Reply-To: <29fbcb88-ab07-26d7-5c81-5ed21baf40c9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2021 08.48, Thomas Huth wrote:
> On 08/12/2021 08.44, Michael S. Tsirkin wrote:
>> On Mon, Dec 06, 2021 at 11:20:39PM +0100, Laurent Vivier wrote:
>>> Add some tests to check the state of the machine if the migration
>>> is cancelled while we are using virtio-net failover.
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>
>> So this one I think is needed for the release. Thomas, are you
>> merging it there or should I?
> 
> rc4 has already been tagged yesterday. I don't think that Richard will still 
> allow another PR at this point in time unless it fixes a really really 
> critical problem. Laurent's series only adds a new qtest, so this certainly 
> does not qualify, AFAIK.

Never mind, I had patch series v7 before my eyes when I hit the reply button 
here. The patch that touches the code outside of the test folder (3/6) has 
already been merged, so we should be fine for the release.

  Thomas


