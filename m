Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E36F70F9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:35:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puco4-0006mK-UQ; Thu, 04 May 2023 13:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puatV-0002SJ-9l
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puatS-0007uA-Pp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683214158;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0biNOlEgXMRd6xpQWaCbW0hbYiqI5wuUnE3w8TrX5q4=;
 b=g4gjBzQ4KCrh2ImSuC2KZD9i7lz+Xc+x6V3D+t/uJsZdvXFIvOHSYqxEYkZ+qqwIZ3sfob
 R145h7ew4pu2wp564dXPWLzYqBMwumzz3rBofaF+RxdAhoRe2OalFuKJ6qY4gr5LUIDCyR
 cV97jTt5NdIph9oopONZ7k5RDi06fBM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-yBhHwq2EOcyVWw0kjkiAqg-1; Thu, 04 May 2023 11:29:16 -0400
X-MC-Unique: yBhHwq2EOcyVWw0kjkiAqg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f195129aa4so4350045e9.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683214155; x=1685806155;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0biNOlEgXMRd6xpQWaCbW0hbYiqI5wuUnE3w8TrX5q4=;
 b=DRcW0ZwvG1uWl9ZgF053V9JwtU0N1YcXdCUSXqK13MqqnKODL628wF92y4HMtrtb0T
 gWFHNIw8UBd5NOh+CzEHpo2BCntPMaUFeemdo88F9+4VPWB1KMiHmnDQEuRizC3yhSoI
 ls1eZlBKOmrQzcgKZ2DijzM8DdIj/WfF2JkJR6JZzs3Utzx7pmfIo9zftKbspzF+8nl/
 fAZPs8iJUdyb9UZDp+inYCJdosFfyr1mSFc6tSbgRTYOCvnT5nKQNghkODfKqTxGVE9P
 s8sdm0Ll77xSl+qYqXT7QexCfQ01TGleWVV6hYJDwFf4oruRcXh5LKZMIAUAwqVgUWAM
 IOcQ==
X-Gm-Message-State: AC+VfDwTTwIdRm7ITQils1pqe8/E7GzeOmGY6WRy8jZSw9ZeqFZNF/lh
 kPfi+i2k5lJs8YwJNan7D2LnqZVE7IiRxq71xu8JALgWgwURsnNcDLUaBk7kRyYFQDA/vfBnuoT
 WqlW4WescUQQG9Fo=
X-Received: by 2002:a1c:7716:0:b0:3f1:75b0:dc47 with SMTP id
 t22-20020a1c7716000000b003f175b0dc47mr59086wmi.15.1683214155648; 
 Thu, 04 May 2023 08:29:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wBdSo7/7gynYbtsUf5MWK3pwpkSqkLnAt2s1nyF0Zh93F7Re6MT5Pq1r7TR/ZepRuaPm8ug==
X-Received: by 2002:a1c:7716:0:b0:3f1:75b0:dc47 with SMTP id
 t22-20020a1c7716000000b003f175b0dc47mr59068wmi.15.1683214155357; 
 Thu, 04 May 2023 08:29:15 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b003f193d7c6b7sm5142150wme.41.2023.05.04.08.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 08:29:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Fam Zheng
 <fam@euphon.net>
Subject: Re: [PATCH 0/9] QEMU file cleanups
In-Reply-To: <ZFPOMzR+zWODGcYY@x1n> (Peter Xu's message of "Thu, 4 May 2023
 11:24:35 -0400")
References: <20230504113841.23130-1-quintela@redhat.com>
 <ZFPFF4MB1j5wNnxe@x1n> <87ttwsp2kx.fsf@secure.mitica>
 <ZFPOMzR+zWODGcYY@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 04 May 2023 17:29:13 +0200
Message-ID: <87lei4p12u.fsf@secure.mitica>
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
> On Thu, May 04, 2023 at 04:56:46PM +0200, Juan Quintela wrote:
>> Peter Xu <peterx@redhat.com> wrote:
>> > On Thu, May 04, 2023 at 01:38:32PM +0200, Juan Quintela wrote:
>> >> - convince and review code to see that everything is uint64_t.
>> >
>> > One general question to patches regarding this - what's the major benefit
>> > of using uint64_t?
>> >
>> > It doubles the possible numbers to hold, but it's already 64bits so I don't
>> > think it matters a lot.
>> 
>> We were checking for negatives even when that can't be.
>> And we are doing this dance of
>> 
>> int64_t x, y;
>> uint64_t a, b;
>> 
>> x = a;
>> b = y;
>> 
>> This is always confusing and not always right.
>
> Yeah this is confusing, but if anything can go wrong with this I assume we
> could have some bigger problem anyway..
>
>> 
>> > The thing is we're removing some code trying to
>> > detect negative which seems to be still helpful to detect e.g. overflows
>> > (even though I don't think it'll happen).  I just still think it's good to
>> > know when overflow happens, and not sure what I missed on benefits of using
>> > unsigned here.
>> 
>> If you grep through the code, you see that half of the things are
>> int64_t and the other half is uint64_t.  I find it always confusing.
>
> Right, I'm personally curious whether we should just use int64_t always
> unless necessary. :) Another good thing with int64_t is it's also suitable
> for error report when used in retvals.

It is used by sizes.  We don't return errors right now.
And if it is negative, we need to check that if it is negative, even
when no code uses the negative functionality.

> But no strong opinion here, I don't think that's a huge deal for now.
> Having such an alignment on types makes sense to me.

Thanks, Juan.


