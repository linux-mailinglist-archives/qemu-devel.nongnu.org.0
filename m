Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388C2CC3F4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:39:08 +0100 (CET)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkW5r-0004oC-4k
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkW4p-0004ES-UC
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:38:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkW4n-000276-Ul
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606930681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GpSfgbYZP0XuJaSbJm3CACXo83+2V2KuqfaCJJLXrgk=;
 b=isSeSPr9WlV8GhZL3VygWyeOpTN1ZcxRKTnnw4QKNGUR0RaZd7dgK9yLngtOrlJJh0Zrur
 zqfEHn/1ZMekAgjPpU4+Q//bHvWGFnr/xBIRTEfDhvlLBO3xlI8ifkQ8PMq/v5dJZDUURt
 lGMBw763iGay+3E6Yl+ypibP1+AWR7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-nF7RuKCzM3OTG2o717XKcw-1; Wed, 02 Dec 2020 12:37:39 -0500
X-MC-Unique: nF7RuKCzM3OTG2o717XKcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6F21185E496;
 Wed,  2 Dec 2020 17:37:37 +0000 (UTC)
Received: from work-vm (unknown [10.33.36.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8E55D6AC;
 Wed,  2 Dec 2020 17:37:36 +0000 (UTC)
Date: Wed, 2 Dec 2020 17:37:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zeyu Jin <jinzeyu@huawei.com>
Subject: Re: [PATCH 1/6] migration: Add multi-thread compress method
Message-ID: <20201202173733.GJ3226@work-vm>
References: <20201127074116.2061-1-jinzeyu@huawei.com>
 <87zh33ruzd.fsf@dusky.pond.sub.org>
 <8dfb932a-929b-7c7f-d675-c330166099fc@huawei.com>
 <875z5njl82.fsf@dusky.pond.sub.org>
 <be97a13d-5426-04c1-c92b-a9b08b52ce99@huawei.com>
MIME-Version: 1.0
In-Reply-To: <be97a13d-5426-04c1-c92b-a9b08b52ce99@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, Markus Armbruster <armbru@redhat.com>,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zeyu Jin (jinzeyu@huawei.com) wrote:
> On 2020/11/30 16:35, Markus Armbruster wrote:
> > Zeyu Jin <jinzeyu@huawei.com> writes:
> > 
> >> On 2020/11/27 17:48, Markus Armbruster wrote:
> >>> Kevin, Max, suggest to skip right to Qcow2CompressionType.
> >>>
> >>> Zeyu Jin <jinzeyu@huawei.com> writes:
> >>>
> >>>> A multi-thread compress method parameter is added to hold the method we
> >>>> are going to use. By default the 'zlib' method is used to maintain the
> >>>> compatibility as before.
> >>>>
> >>>> Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
> >>>> Signed-off-by: Ying Fang <fangying1@huawei.com>
> >>> [...]
> >>>> diff --git a/qapi/migration.json b/qapi/migration.json
> >>>> index 3c75820527..2ed6a55b92 100644
> >>>> --- a/qapi/migration.json
> >>>> +++ b/qapi/migration.json
> >>>> @@ -525,6 +525,19 @@
> >>>>    'data': [ 'none', 'zlib',
> >>>>              { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> >>>>  
> >>>> +##
> >>>> +# @CompressMethod:
> >>>> +#
> >>>> +# An enumeration of multi-thread compression methods.
> >>>> +#
> >>>> +# @zlib: use zlib compression method.
> >>>> +#
> >>>> +# Since: 6.0
> >>>> +#
> >>>> +##
> >>>> +{ 'enum': 'CompressMethod',
> >>>> +  'data': [ 'zlib' ] }
> >>>> +
> >>>>  ##
> >>>>  # @BitmapMigrationBitmapAlias:
> >>>>  #
> >>>> @@ -599,6 +612,9 @@
> >>>>  #                      compression, so set the decompress-threads to the number about 1/4
> >>>>  #                      of compress-threads is adequate.
> >>>>  #
> >>>> +# @compress-method: Set compression method to use in multi-thread compression.
> >>>> +#                   Defaults to zlib. (Since 6.0)
> >>>
> >>> We already have @multifd-compression.  Why do we need to control the two
> >>> separately?  Can you give a use case for different settings?
> >>>
> >>
> >> Generally, mulit-thread compression deals with the situation
> >> where network bandwith is limited but cpu resource is adequate. Multifd
> >> instead aims to situation where single fd cannot take full advantage of
> >> network bandwith. So compression based on multifd cannot fully cover the
> >> cases for multi-thread compression.
> >>
> >> For example, for migration with a bandwith limitation of 10M
> >> bytes/second, single fd is enough for data delivery. This is the case
> >> for multi-thread compression.
> > 
> > Let me rephrase my question.
> > 
> > According to query-migrate-parameters, we default to
> > 
> >     "compress-level": 1
> >     "compress-threads": 8
> >     "compress-wait-thread": true
> >     "decompress-threads": 2
> >     "multifd-channels": 2
> >     "multifd-compression": "none"
> >     "multifd-zlib-level": 1
> >     "multifd-zstd-level": 1
> > 
> > Your patch adds
> > 
> >     "compress-method": "zlib"
> > 
> > I have several basic questions I can't answer from the documentation:
> > 
> > 1. We appear to have two distinct sets of compression parameters:
> > 
> >    * Traditional: compress-level, compress-threads,
> >      compress-wait-thread, decompress-threads.
> > 
> >      These parameters all apply to the same compression.  Correct?
> > 
> >      What data is being compressed by it?
> > 
> >    * Multi-fd: multifd-channels, multifd-compression,
> >      multifd-zlib-level, multifd-std-level
> > 
> >      These parameters all apply to the same compression.  Correct?
> > 
> >      What data is being compressed by it?
> > 
> >    * Why do we want *two*?  I understand why multi-fd is optional, but
> >      why do we need the capability to compress differently there?  Use
> >      case?
> > 
> >    All of these questions predate your patch.  David, Juan?
> >
> 
> I see. The problem is that the parameter sets seem to be redundant and
> maybe there is an overlap between these two compression capabilities.
> 
> As you said, the questions predate my patch, so maybe we can have a
> discussion here. What do you think, David, Juan?

Yes it's true, they're redundant - it's the same settings duplicated
for the two systems, traditinoal and multifd.

Can I ask - have you compared the behaviour of multifd-zstd with plain
zstd?  I ask, because it's a shame to have two separate systems; and if
multifd-zstd worked well, then it would be good someday to deprecate the
non-multifd version of compression completely, and simplify a lot of
code that way.

Dave


> > 2. Does compress-method belong to "traditional"?
> >
> 
> Yes.
> 
> >>> If we do want two parameters: the names @compress-method and
> >>> @multifd-compression are inconsistent.  According to your comment,
> >>> @compress-method applies only to multi-thread compression.  That leads
> >>> me to suggest renaming it to @multi-thread-compression.
> >>>
> >>
> >> For the names, my original idea is to make 'CompressMethod' consistent
> >> with other multi-thread compression parameters, like 'compress-threads'
> >> and 'compress-level'. There is truly some inconsistency here, between
> >> multifd-compression params and old multi-thread compression params.
> > 
> > I see.
> > 
> >> For now, I agree with you that 'multi-thread-compression' is better. It
> >> is more specific and clear. I will rename the params in next version.
> >> Thanks for the suggestion.
> > 
> > Please wait until we've sorted out the documentation mess.
> > 
> >>> After PATCH 4, CompressMethod is almost the same as MultiFDCompression:
> >>>
> >>>    { 'enum': 'CompressMethod',
> >>>      'data': [ 'zlib' ] }
> >>>      'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> >>>
> >>>    { 'enum': 'MultiFDCompression',
> >>>      'data': [ 'none', 'zlib',
> >>>                { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> >>>
> >>> The difference is member 'none'.  Why does compression 'none' make sense
> >>> for multi-fd, but not for multi-thread?
> >>>
> >>
> >> When you set 'none'in multi-fd compression, you would not use the
> >> compression capability in multi-fd.
> >>
> >> In comparison, once you turn on multi-thread compression capability, you
> >> have already admitted to use compression. In this case, member 'none' is
> >> meaningless.
> > 
> > Let me rephrase my question:
> > 
> > How do you select zlib, zstd and no compression for "traditional"?
> > 
> 
> By parameter "compress-method". And there is no need to support "no
> compression" in "traditional" compression.
> 
> > If zlib, how do you set the compression level (0 = none, 1 = fastest
> > compression, 9 = best compression)?
> > 
> > If zstd, how do you set the compression level (0 = none, 1 = fastest
> > compression, 20 = best compression)?
> >
> 
> In "traditional", zlib and zstd use the same parameter "compress_level".
> For each compression method, we will use different parameter check to
> make sure the level number is correct.
> 
> > How do you select zlib, zstd and no compression for "multi-fd"?
> > 
> 
> By parameter "multifd-compression".
> 
> > If zlib, how do you set the compression level (0 = none, 1 = fastest
> > compression, 9 = best compression)?
> > 
> > If zstd, how do you set the compression level (0 = none, 1 = fastest
> > compression, 20 = best compression)?
> >
> 
> In "multi-fd", the compress level for each method is separated, which
> means, you use "multifd-zlib-level" for zlib, "multifd-zstd-level" for
> zstd.
> 
> The way to set level is different.
> 
> >>> If the difference is wanted: the names are inconsistent.  Less of an
> >>> issue than member names, because type names are not externally visible.
> >>> Let's make them consistent anyway.
> >>>
> >>> Hmm, there's also Qcow2CompressionType.  That's another conversation;
> >>> I'll start a new thread for it.
> >>>
> >>> [...]
> >>>
> >>> .
> >>>
> > 
> > .
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


