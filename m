Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8DC681083
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUl7-0002lS-DJ; Mon, 30 Jan 2023 09:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUl3-0002kF-Nj
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:03:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUl2-0006oO-3v
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675087418;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GFDl8ctoKYbV0a04ymixAPgHfyy16Jaf5DGg/RVheYY=;
 b=EsSgph/Qp3tC8QzXJ6So2Hv0NvI+iy7OgGacMSfE6jLTIn90ynigNMOUOI2wHfdAxh2OVz
 DAXVqnCiAZ9GtAaWDEaMebZeqrHxLHW28TJO1mMpBXzdXHGCe2MDU4Inrj3fha0KmtqGUx
 0zsBGnk256OMK/odxqC2rp6eJnrahRw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-AFBkXteoNgKJ-qM2Qd2Pog-1; Mon, 30 Jan 2023 09:03:37 -0500
X-MC-Unique: AFBkXteoNgKJ-qM2Qd2Pog-1
Received: by mail-wr1-f70.google.com with SMTP id
 b15-20020adfc74f000000b002be276d2052so1936972wrh.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFDl8ctoKYbV0a04ymixAPgHfyy16Jaf5DGg/RVheYY=;
 b=mslV8NLHA7VyORKzb0qryqfhc/XVD5wlhJcp9rqOM3R1sztDdM+jZNM0tOVvhNUF3V
 NMU9+dyIHOKJXYd8UWAThbz/E3LolGYLK7WenrX++i2VIRQufX2Y1DCAzTPudiyudSHB
 ysxjeTuQwN3QtaAwqUfgWOqKzRMUH13xL00r97t696/7eiHL8UnG+f1/woIGHDwp7Ck8
 mFqzisPYjK/fZWAq5SbHucZsgr5bJPXB3Eae/CD50wv4aBjUr6T27PAHG7HNzln+skhx
 TNOLtpPnCftXyrNtXRydTXMsdG25RHteuoCjQkeBrsFjBMxEWdJd1R0Vt5dLvSYnSoQj
 v4Ew==
X-Gm-Message-State: AFqh2kq9J0Xi49lTfhMrl2ZScuMfn+f95DEnkmp4XSMP2X3Ebe2fWwPA
 L/Zubot7TJzkiXQgusEaHRJhBdkC/bM+3Pmq7m/63qIGgv9RuBiB8ZAEM9q37RlkdU2wPfCf2hm
 w0bERlsA1K9SdX7g=
X-Received: by 2002:a05:600c:5390:b0:3d9:a145:4d1a with SMTP id
 hg16-20020a05600c539000b003d9a1454d1amr46505722wmb.34.1675087416547; 
 Mon, 30 Jan 2023 06:03:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFKY4wKErVPwFCfwK4FLNSp/wvUmeuvqtCRuIbk5kLqNzjinre/Qxz9IoU8Lxhe11MtelbVA==
X-Received: by 2002:a05:600c:5390:b0:3d9:a145:4d1a with SMTP id
 hg16-20020a05600c539000b003d9a1454d1amr46505673wmb.34.1675087416171; 
 Mon, 30 Jan 2023 06:03:36 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l16-20020a7bc350000000b003d9aa76dc6asm19125415wmj.0.2023.01.30.06.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:03:35 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <berrange@redhat.com>,  <dgilbert@redhat.com>,
 <yubihong@huawei.com>,  <xiexiangyou@huawei.com>,
 <zhengchuan@huawei.com>,  <linyilu@huawei.com>
Subject: Re: [PATCH 2/3] migration: implement query migration threadinfo by
 name
In-Reply-To: <9b3fc9df-d273-4008-36c2-c779a40132c2@huawei.com> (Jiang
 Jiacheng's message of "Mon, 30 Jan 2023 20:48:38 +0800")
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-3-jiangjiacheng@huawei.com>
 <87o7qgode5.fsf@secure.mitica>
 <9b3fc9df-d273-4008-36c2-c779a40132c2@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 15:03:33 +0100
Message-ID: <877cx4p1ai.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
> On 2023/1/30 12:27, Juan Quintela wrote:
>> Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
>>> Introduce interface query-migrationthreads. The interface is use
>>> with the migration thread name reported by qemu and returns with
>>> migration thread name and its pid.
>>> Introduce threadinfo.c to manage threads with migration.
>>>
>>> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
>> 
>> I like this query interface better than the way you expose the thread
>> name in the 1st place.
>
> The event in patch1 is used to pass the thread name since libvirt
> doesn't know the name of the migration thread but the interface below
> need its name.
> I think the event can be dropped if we store the thread name in
> libvirt(if the migration thread name is fixed in qemu) or using the
> 'query-migrationthreads' you mentioned below.

I preffer the query migrationthreads, thanks.
>
>> 
>> But once that we are here, why don't we just "tweak" abit the interface:
>> 
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index b0cf366ac0..e93c3e560a 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -1970,6 +1970,36 @@
>>>  { 'command': 'query-vcpu-dirty-limit',
>>>    'returns': [ 'DirtyLimitInfo' ] }
>>>  
>>> +##
>>> +# @MigrationThreadInfo:
>>> +#
>>> +# Information about migrationthreads
>>> +#
>>> +# @name: the name of migration thread
>>> +#
>>> +# @thread-id: ID of the underlying host thread
>>> +#
>>> +# Since: 7.2
>>> +##
>>> +{ 'struct': 'MigrationThreadInfo',
>>> +  'data': {'name': 'str',
>>> +           'thread-id': 'int'} }
>> 
>> 1st, it is an int enough for all architectures?  I know that for linux
>> and friends it is, but not sure about windows and other weird systems.
>> 
>
> It is only enough for migration pin which I want to implement. But I
> think this struct can be easily expand if we need other information
> about migration thread.

I mean that pthread_t (what you are passing here) is an int on linux.
Not sure on other OS's.

>>> +##
>>> +# @query-migrationthreads:
>> 
>> What about renaming this to:
>> 
>> @query-migrationthread (I removed the last 's')
>> 
>> because it returns the info of a single thread.
>> 
>>> +#
>>> +# Returns threadInfo about the thread specified by name
>>> +#
>>> +# data: migration thread name
>>> +#
>>> +# returns: information about the specified thread
>>> +#
>>> +# Since: 7.2
>>> +##
>>> +{ 'command': 'query-migrationthreads',
>>> +  'data': { 'name': 'str' },
>>> +  'returns': 'MigrationThreadInfo' }
>>> +
>>>  ##
>>>  # @snapshot-save:
>>>  #
>> 
>> And leaves the @query-migrationthreads name for something in the spirit of
>> 
>>> +{ 'command': 'query-migrationthreads',
>>> +  'returns': ['str'] }
>> 
>> That returns all the migration threads names.
>> 
>> Or perhaps even
>> 
>>> +{ 'command': 'query-migrationthreads',
>>> +  'returns': ['MigrationThreadInfo'] }
>> 
>> And call it a day?
>
> I think it's the best. If in this way, should we keep the interface to
> query specified thread?

I wouldn't do it, but it is up to you.

My (little) understanding of what you want to do is that you want all
the threads, so I see no reason to have a query for a single one.

Later, Juan.


