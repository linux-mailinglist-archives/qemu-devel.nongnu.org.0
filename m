Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B93BC84E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:07:58 +0200 (CEST)
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0h3d-0005mO-DJ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0h2A-0004QA-Ri
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:06:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0h27-0005GA-1b
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625562382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yiZN0wc6RQtVTKrqMnJF0XFNYQyZwC5Eh6wExEjr2JE=;
 b=MKxoSbwhHZUGRaUDgFYBC9Ot8BJ4x4KipK8/aocead8xWUeGfRw3H46yosmMBQOuIxc8bT
 Q7jV2iTdV40d6vhGKo7SMNwedmgYAKX4dvNa+KOyqgGxVTGeHusxPxYkm6W2Qx0J7T2HIH
 ukzeTrrrqak6YpV9jQ/rinIUP+yviYQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-OmDJ67azPFGnyTIh8bgVQw-1; Tue, 06 Jul 2021 05:06:21 -0400
X-MC-Unique: OmDJ67azPFGnyTIh8bgVQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r11-20020a5d52cb0000b02901309f5e7298so3598566wrv.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 02:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yiZN0wc6RQtVTKrqMnJF0XFNYQyZwC5Eh6wExEjr2JE=;
 b=XENKh96OIKfcAoatP+8LpPOERFDTkx33jzoOmv4RnYZGnseJauAS43tgqO7FDXSejO
 pIQtuKpP8plPxJWGJIUBN88hSkNJTugXU1FTbXBYc8BBbyvMI0CPrsnzr+vHijufs/Ay
 UWYn97y8c1vWAbFMcCv0kGySW7FkwLTercdYVZhNih15cwel5zkgcKTKElXAnPY1vAbJ
 oO0PFF7Etf/FJKt7KCMvRoI4HBbiPdNdqm5wXSiTmCTWa+5vrXX4n9YUoEdJ1txzX+Eb
 jHdURtcA3YmXOtcxqZo+zaL6Jry28GLRE1KnmdMPoL/w1AM9QXzfUYCj7d7FvuWLhIN7
 857w==
X-Gm-Message-State: AOAM533gBrwItFrsIHsAWpleMVWHvh/JREkQqgz91YtJGRLoErYAp7oP
 6E9toYeb3nTuZJZRrYzgINc5FdaXW95Nl8e1aFbeRdqQbt5+HCX8DCaoj3A+/7cGHJpYlFb7B0H
 YnmmC4GhrXANGCLI=
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr19082448wma.33.1625562380144; 
 Tue, 06 Jul 2021 02:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV9+4zQaUoGlETtIL9sprKdg+XJodaYzLv1C3emD37VylpsWxWLvvbX+r+jo+6GK7NHB1d5Q==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr19082422wma.33.1625562379860; 
 Tue, 06 Jul 2021 02:06:19 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
 by smtp.gmail.com with ESMTPSA id s24sm1019626wra.33.2021.07.06.02.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 02:06:19 -0700 (PDT)
Subject: Re: [RFC v6 08/13] target/s390x: split cpu-dump from helper.c
To: Al Cho <ACho@suse.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cfontana@suse.de" <cfontana@suse.de>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-9-acho@suse.com>
 <f4848e38-ecce-c6b1-254b-e93fe45711ca@redhat.com>
 <1fc14922aa88d7cd6cbfe3e5e76e10aa8150fe4a.camel@suse.com>
 <101135a9-2b08-ab8b-dd48-8fc1d8f00358@suse.de>
 <27d64c9b946b8d7183b6f7d5154aa36fad9dec23.camel@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7083a732-53ff-39a7-bffc-f47946949fec@redhat.com>
Date: Tue, 6 Jul 2021 11:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <27d64c9b946b8d7183b6f7d5154aa36fad9dec23.camel@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Claudio Fontana <Claudio.Fontana@suse.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2021 10.47, Al Cho wrote:
> On Mon, 2021-07-05 at 08:25 +0200, Claudio Fontana wrote:
>> On 7/2/21 9:25 AM, Al Cho wrote:
>>> On Thu, 2021-07-01 at 14:35 +0200, Thomas Huth wrote:
>>>> On 29/06/2021 16.19, Cho, Yu-Chen wrote:
>>>>> Splitting this functionality also allows us to make helper.c
>>>>> sysemu-
>>>>> only.
>>>>>
>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
>>>>> Acked-by: Cornelia Huck <cohuck@redhat.com>
>>>>> ---
>>>>>    target/s390x/cpu-dump.c  | 176
>>>>> +++++++++++++++++++++++++++++++++++++++
>>>>
>>>> Apart from the dump() function, the other functions here are are
>>>> used
>>>> in
>>>> other contexts, too, so maybe the name is not very appropriate
>>>> here...
>>>> What
>>>> about naming it "cpu-state.c" instead? Or include the functions
>>>> in
>>>> cpu.c
>>>> directly?
>>>>
>>>
>>> ok, I think naming it "cpu-state.c" would make more sense.
>>>
>>> Thanks,
>>>              AL
>>>
>>
>> For context, cpu-dump.c mimics how this is done on x86,
>>
>> so rather than coming up with creative new names for each
>> architecture,
> 
> I think Claudio is right, I didn't recognize it before. sorry.
> 
>> I'd rather either put the code into cpu.c, or just keep the existing
>> "cpu-dump.c" as in the initially proposed patch, which looks like the
>> best option to me.
>>
> 
> For me just keep the existing "cpu-dump.c" as in the initially proposed
> patch would be the better one option.
> But it's also good to me if we keep the dump() function in cpu-dump.c
> and put other functions into cpu.c.

FWIW, if you don't like cpu-state.c, I'd vote for putting the dump() 
function into cpu-dump.c and put the other functions into cpu.c instead.

  Thomas


