Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEB11ED0E9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 15:35:08 +0200 (CEST)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgTXu-0003JS-VQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 09:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jgTX0-0002Go-W7
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 09:34:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41963
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jgTWz-0008Fl-Ia
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 09:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591191248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUz3VuJoR/h5+pbpPOIhGlLeOogIr74x+lItSVqVr98=;
 b=XFz7I2PHJ9pe9mmWW1eFb3VeO6xdu0eiBEaRbAbV3dFSG45q4ZDQBiXMUkZU/ARCy2AGLl
 IW7hnlNhFn858K6HYc4zmwzCMy+5LYrStvpaf1jO2NudTtN1DOiaA7lLhWQWjaXLngAd/7
 X3i9S9jkYxCY3Q0X3X2tBUozgFbj7m0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-JVWTWtWWNLaEPrcz3bvMKQ-1; Wed, 03 Jun 2020 09:34:05 -0400
X-MC-Unique: JVWTWtWWNLaEPrcz3bvMKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B27AEC1A3;
 Wed,  3 Jun 2020 13:34:04 +0000 (UTC)
Received: from work-vm (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9BA211CC03;
 Wed,  3 Jun 2020 13:33:56 +0000 (UTC)
Date: Wed, 3 Jun 2020 14:33:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PULL 04/12] hmp: Simplify qom-set
Message-ID: <20200603133354.GF2974@work-vm>
References: <87pnai7ymz.fsf@dusky.pond.sub.org> <20200602092601.GD2758@work-vm>
 <847cb8b5-1507-46cf-495a-952d41a3c2b2@redhat.com>
 <20200603104306.GC2974@work-vm>
 <457c1ac7-3281-5e98-481b-34d44e5174de@redhat.com>
 <20200603114317.GD2974@work-vm>
 <728b8cf4-7574-776c-c7fe-3ed5e20b33d2@redhat.com>
 <20200603122413.GE2974@work-vm>
 <b7914ae9-ffb1-cc5d-9112-c8e9607ce9c5@redhat.com>
 <8c6b3fae-a74c-effa-2d38-5e8cd4c72066@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8c6b3fae-a74c-effa-2d38-5e8cd4c72066@redhat.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:12:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_HK_NAME_DR=0.01 autolearn=_AUTOLEARN
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
Cc: mszeredi@redhat.com, lukasstraub2@web.de, quintela@redhat.com,
 qemu-devel@nongnu.org, pannengyuan@huawei.com, f4bug@amsat.org,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> On 03.06.20 14:26, David Hildenbrand wrote:
> > On 03.06.20 14:24, Dr. David Alan Gilbert wrote:
> >> * David Hildenbrand (david@redhat.com) wrote:
> >>> On 03.06.20 13:43, Dr. David Alan Gilbert wrote:
> >>>> * David Hildenbrand (david@redhat.com) wrote:
> >>>>> On 03.06.20 12:43, Dr. David Alan Gilbert wrote:
> >>>>>> * David Hildenbrand (david@redhat.com) wrote:
> >>>>>>> On 02.06.20 11:26, Dr. David Alan Gilbert wrote:
> >>>>>>>> * Markus Armbruster (armbru@redhat.com) wrote:
> >>>>>>>>> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:
> >>>>>>>>>
> >>>>>>>>>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >>>>>>>>>>
> >>>>>>>>>> Simplify qom_set by making it use qmp_qom_set and the JSON parser.
> >>>>>>>>>>
> >>>>>>>>>> (qemu) qom-get /machine smm
> >>>>>>>>>> "auto"
> >>>>>>>>>> (qemu) qom-set /machine smm "auto"
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>>>>>>>> Message-Id: <20200520151108.160598-3-dgilbert@redhat.com>
> >>>>>>>>>> Reviewed-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> >>>>>>>>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >>>>>>>>>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>>>>>>>>   With 's'->'S' type change suggested by Paolo and Markus
> >>>>>>>>>
> >>>>>>>>> This is actually more than just simplification, it's disarming a bear
> >>>>>>>>> trap: the string visitor is restricted to a subset of the QAPI types,
> >>>>>>>>> and when you qom-set a property with a type it can't handle, QEMU
> >>>>>>>>> aborts.  I mentioned this in the discussion of possible ways out of the
> >>>>>>>>> qom-get impasse, but missed reraising it in patch review.
> >>>>>>>>>
> >>>>>>>>> A suitably amended commit would be nice, but respinning the PR just for
> >>>>>>>>> that may not be worthwhile.
> >>>>>>>>
> >>>>>>>> A bit late; still as long as we're removing bear traps not adding them.
> >>>>>>>
> >>>>>>> This breaks qom-set for my (virtio-mem) use case:
> >>>>>>>
> >>>>>>> echo "qom-set vm0 requested-size 300M" | sudo nc -U /var/tmp/mon_src
> >>>>>>> QEMU 5.0.50 monitor - type 'help' for more information
> >>>>>>> (qemu) qom-set vm0 requested-size 300M
> >>>>>>> Error: Expecting at most one JSON value
> >>>>>>
> >>>>>> Does qom-set vm0 requested-size 300e6 do the same thing?
> >>>>>
> >>>>> The property is defined to be of type "size".
> >>>>>
> >>>>> (qemu) qom-set vm0 requested-size 300e6
> >>>>> Error: Parameter 'requested-size' expects uint64
> >>>>>
> >>>>> (not sure how "size" and "uint64" are mapped here)
> >>>>
> >>>> I think the problem here is that the JSON parser is converting anything
> >>>> with an 'e' as a float; JSON itself doesn't have the distinction
> >>>> between int and float.
> >>>>
> >>>
> >>> (and just to clarify - I assume you are aware - 300e6 != 300M. So the
> >>> interface becomes way harder to use in case one wants to specify
> >>> properly aligned sizes - 300M vs 314572800)
> >>
> >> Oops, yes, good point.
> >>
> >> I think on balance it's probably best that this keeps supporting JSON;
> >> although tbh I'm not convinced there are any complex types that can be
> >> set.
> >> I'm not seeing a prettier answer.
> > 
> > So, I have to use a calculator from now on to set a property that I can
> > set on the QEMU cmdline just fine without it? :(
> > 
> > This feels like a step backwards, @Markus any way to keep supporting sizes?
> 
> Or what about adding qom-set-json instead for complex types instead of
> changing the behavior if an existing interface?

Yes, this isn't nice - we could add a flag to qom-set to take nice
numerics.

Dave

> -- 
> Thanks,
> 
> David / dhildenb
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


