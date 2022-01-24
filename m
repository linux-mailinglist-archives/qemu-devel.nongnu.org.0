Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC5749900E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:58:45 +0100 (CET)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5UD-0003fI-3b
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:58:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC4iM-0007ex-JT
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:09:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC4iJ-0000d7-IA
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643051354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/m73ETcHb4qqyJLKy4vgPBauiZm3sVsua83HY5cZaSg=;
 b=GUEJkcOmob+Z7bAhY14ZUkDIhKehJHpgpgQtCFruYAzSeoTslfJveNa8TRescAAbcd2iCT
 LfSqT28wIvuqSsz1ntxFzECxnbN6DfV/C3v0txnBEXyn1DyYfzSKVSl2BXhal/4LBN7qYy
 FIE2+n/AZpUTrcWFZxloIPX/bEC4eYI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-XCd2OgTeMTWHCp6bwzMCfQ-1; Mon, 24 Jan 2022 14:09:13 -0500
X-MC-Unique: XCd2OgTeMTWHCp6bwzMCfQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 z84-20020a1f9757000000b0031ba7827bcaso2493690vkd.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 11:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/m73ETcHb4qqyJLKy4vgPBauiZm3sVsua83HY5cZaSg=;
 b=5S7KF8p2ucYHC5RoZT37uwdPWUoQ8PI4AKymc2PmnOuyNpJW1LxY6SUAVG+MN3GLpi
 94JbX0IoT9MyzbrTEy3iP9ZpwYxTmeLOKae1xJMMAL2OrTu1wW+nAB375i+9bZqN7sAa
 mewbYgTIdWJiITE8/iBPJDQ63gj+h5kUbd4az5Jp0nq9sGVZmAc+SNaaQy3Bv0dp6LiC
 G0V83m12R8LFtg3wX71RlNzwdJfcjK0Ic4nbDwfoXWTYH3EH5R+mkSkDzZOxP/3kNvhg
 NvfwlQIo5y0pUwcK8WCkNJDJOU7Xi6dhT+O7QHcvgwyQosJjo4A20HM5TEYWBQqunmNx
 oHKA==
X-Gm-Message-State: AOAM533v8YggIzz2Ho54+cSqqXxEVFln713DBh6xCHUi1uTUEDjNxUqr
 JFvocWtpaxcIiTU4O1/9lKPZKO/SLFi45EzRiDwn5vOGwrkZUW2QXpGF2SrEigVNTOcLZNI6cQl
 uXNtg0QKhze+K++mDRaeYfUkxW1IR0uQ=
X-Received: by 2002:a9f:2583:: with SMTP id 3mr6164845uaf.32.1643051352495;
 Mon, 24 Jan 2022 11:09:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFDMkx95hKu0E8bkAhJ0wCKTtAgBLHUg2Ut4fkU3X4uLoi4nMimDx9LKCBt1iuzkAMYct0k4fsDIFtpGAWXAE=
X-Received: by 2002:a9f:2583:: with SMTP id 3mr6164837uaf.32.1643051352251;
 Mon, 24 Jan 2022 11:09:12 -0800 (PST)
MIME-Version: 1.0
References: <cccba1ec-34c7-73da-1100-416a0afa8cea@greensocs.com>
 <cd48c959-9262-cc42-73c0-3d10a4bd44b1@greensocs.com>
 <87ee543uh8.fsf@dusky.pond.sub.org>
In-Reply-To: <87ee543uh8.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 24 Jan 2022 14:09:01 -0500
Message-ID: <CAFn=p-Y1um_4k33XRPshWy6QjvMGvhq_tfR+s8EFBTFwhkBnrQ@mail.gmail.com>
Subject: Re: RFC: QMP configuration - allocating/setting qdev array properties?
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 5:12 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Damien Hedde <damien.hedde@greensocs.com> writes:
>
> > Hi Mirela,
> >
> > On 1/11/22 17:54, Mirela Grujic wrote:
> >> Hi,
> >>
> >> While working on a prototype and configuring a whole machine using
> >> QMP we run into the following scenario.
> >>
> >> Some device models use array properties.
>
> A gift that keeps on giving...
>
> >>                                          The array is allocated when
> >> len-<arrayname> property is set, then, individual elements of the
> >> array can be set as any other property (see description above the
> >> DEFINE_PROP_ARRAY definition in qdev-properties.h for more
> >> details). We need to do both (allocate the array and set its
> >> elements) before the device can be realized. Attempting to set
> >> len-<arrayname> and array elements in a single device_add command
> >> does not work because the order of setting properties is not
> >> guaranteed, i.e. we're likely attempting to set an element of the
> >> array that's not yet allocated.
> >
> > It happens because device options are stored in an optdict. When this
> > optdict is traversed to set the qdev-properties, no specific order is
> > used.
>
> To be precise: it's stored in a QDict[*]
>
> qdev_device_add_from_qdict() sets properties with
> object_set_properties_from_qdict(), which iterates over the QDict in
> unspecified order.
>
> > Better json format support would probably solve this issue in the
> > long-term. But right now, we are stuck with the optdict in the middle
> > which do not support advanced structure like lists or dictionaries.
>
> I figure you mean actual array-valued properties, like
>
>     'foo': [ 1, 2, 3 ]
>
> instead of
>
>     'len-foo': 3, 'len[0]': 1, 'len[1]': 2, 'len[2]': 3
>
> > We could solve this by being more "smart" in when setting the
> > properties. I'm not sure we can be really smart here and detect which
> > options is an array length but we could at least have some heuristic
> > and for example: set first "len-xxx" properties so that array will be
> > allocated before being filled.
>
> Ugh!
>
> Another stop gap solution could be making QDict iterate in insertion
> order, like Python dict does since 3.6.
>

I like this idea, I think. Are there any possible downsides here?
Making the order more 'stable' in one regard might lead to people
trusting it "too often" if there are other implementation details that
might impact the order ... but I don't actually have any examples
handy for that. It's just my fear.

--js


