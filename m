Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23E12C65AB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:23:12 +0100 (CET)
Received: from localhost ([::1]:34820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicmN-0001P2-Qq
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kicki-0000nb-52
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kickg-0001ko-I3
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606479686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVi1QVUjWSICtjgQeHRgkPXn/9bd1BvIP54hJc9Et1o=;
 b=hcChEUXFVsKMMJOxTV47yVu5JZEZc+dgQ4n5bJc+n6HZZB/N/1xWzCkbqysOTekcKjLMlx
 tblb+E2EkPROdqgn2k7yR0w9ys/DmN9F+tOlH+8bqqOrVKhA85DlrZBpBCoFfdGYNNWao/
 Je5QBy8szgNIppPGs7lsh9vo06uEM0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-g7rOFq4jMAiFtHs0ee1peg-1; Fri, 27 Nov 2020 07:21:21 -0500
X-MC-Unique: g7rOFq4jMAiFtHs0ee1peg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E24B6805BFA;
 Fri, 27 Nov 2020 12:21:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 803F710023BA;
 Fri, 27 Nov 2020 12:21:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 177A4113864E; Fri, 27 Nov 2020 13:21:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: ImageInfo oddities regarding compression
References: <87r1ofru4z.fsf@dusky.pond.sub.org>
 <20201127101405.GA1596141@redhat.com>
 <20201127103216.GA4736@merkur.fritz.box>
Date: Fri, 27 Nov 2020 13:21:18 +0100
In-Reply-To: <20201127103216.GA4736@merkur.fritz.box> (Kevin Wolf's message of
 "Fri, 27 Nov 2020 11:32:16 +0100")
Message-ID: <87ft4vq9c1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Denis Plotnikov <dplotnikov@virtuozzo.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 27.11.2020 um 11:14 hat Daniel P. Berrang=C3=83=C6=92=C3=82=C2=A9 gesc=
hrieben:
>> On Fri, Nov 27, 2020 at 11:06:36AM +0100, Markus Armbruster wrote:
>> > ImageInfo has an optional member @compressed:
>> >=20
>> >     ##
>> >     # @ImageInfo:
>> >     [...]
>> >     # @compressed: true if the image is compressed (Since 1.7)
>> >=20
>> > Doc bug: neglects to specify the default.  I guess it's false.
>
> I think rather than false (definitely not compressed) it might just mean
> unknown, see below.
>
>> > The only user appears to be vmdk_get_extent_info().  Goes back to
>> > v1.7.0's commits
>> >=20
>> >     f4c129a38a vmdk: Implment bdrv_get_specific_info
>> >     cbe82d7fb3 qapi: Add optional field 'compressed' to ImageInfo

Should it be in ImageInfoSpecificVmdk instead?

I know we can't just move it, and copy, deprecate, wait, delete may not
be worth the bother.  Sill, I'm curious :)

>> > ImageInfo also has an optional member @format-specific.
>> >=20
>> > Doc bug: neglects to specify when it's present.  I assume it's always
>> > present when member @format has a value that has a non-empty variant i=
n
>> > @format-specific's type ImageInfoSpecific.
>
> This seems to be the intention, yes.
>
>> > Format qcow2's variant is ImageInfoSpecificQCow2.  It has a mandatory
>> > member @compression-type.
>> >=20
>> >    ##
>> >    # @Qcow2CompressionType:
>> >    #
>> >    # Compression type used in qcow2 image file
>> >    #
>> >    # @zlib: zlib compression, see <http://zlib.net/>
>> >    # @zstd: zstd compression, see <http://github.com/facebook/zstd>
>> >    #
>> >    # Since: 5.1
>> >    ##
>> >    { 'enum': 'Qcow2CompressionType',
>> >      'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' =
} ] }
>> >=20
>> > Apparently, you can't have a qcow2 image without compression.  Correct=
?
>> >=20
>> > Can you imagine a use case for "without compression"?
>>=20
>> Yes & no. An image always has a compression type, either implicitly
>> zlib as the historical default, or explicitly as a type recorded in
>> the header.  This doesn't mean compression is used.
>>=20
>> There may be zero or more clusters actually using compression.
>> Typically compression will never be used, but there's still an
>> associated compression type regardless.
>
> Right, so the correct answer to "is this image compressed?" is "unknown"
> for qcow2. Providing an answer would require checking all clusters in
> the image for the compression flag, which is not something we want to do
> for query-block. And even if we did that, it would still be unclear what
> to do with a partially compressed image.
>
> The @compression-type only tells you what format a compressed cluster
> uses if any compressed cluster exists in the image (or if a new
> compressed cluster is written to it). It doesn't mean that such clusters
> currently exist.

Makes sense.

If we had a compression type 'none', it would effectively tell us that
the image is definitely not compressed, because any "compressed"
clusters would use method none, i.e. be not compressed.  Observation,
not feature request.

>> I fell down this (thankfully shallow) rabbit hole because we also have
>>=20
>>     { 'enum': 'MultiFDCompression',
>>       'data': [ 'none', 'zlib',
>>                 { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>>=20
>> I wonder whether we could merge them into a common type.

Looks like we could: current code would never report the additional
value 'none'.  Introspection would show it, though.  Seems unlikely to
cause trouble.  Observation, not demand.


