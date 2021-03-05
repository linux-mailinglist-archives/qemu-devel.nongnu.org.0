Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC2D32E535
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:48:16 +0100 (CET)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI74B-00058A-MR
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lI70W-0002Uj-4V
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:44:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lI70S-0007bv-8m
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614937463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJsNUl53QuWM54wfkEX3e3kPeBfCWCsgqRqQR640Ykg=;
 b=U0BFlTHgwdU/rDvxo5LdtmIZEVWctGxUkGm/23i+ia1Z5BrKLfUqanXcx2V49qKOnbL/4H
 QFTyNcWR/2W3Hg5IiZf7u0wXMYi0hdH8rU7z5A/SnpGtsjGvERRpfcrSxt9ACXKPTWd4Q8
 vAN/DvNq2euEkMa5Ou89EG3yAoHkw6s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-1O4s0c76MMaGF0cVdT3lCQ-1; Fri, 05 Mar 2021 04:44:21 -0500
X-MC-Unique: 1O4s0c76MMaGF0cVdT3lCQ-1
Received: by mail-ed1-f72.google.com with SMTP id n20so673116edr.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WJsNUl53QuWM54wfkEX3e3kPeBfCWCsgqRqQR640Ykg=;
 b=K5jtVZmzcYEnX/f75u9qBtKe5PlQCiIH1S5rb+3ZLW4ug5DxALm8wn8GXVhlYaTV9u
 XVcIeCxMlt0NN2F+vRe2EGjjWxntX2b4QRqxe9vbRHxC8go+nyzs/TCy/i8VLowo6dE/
 XfixWXX4NZpzUJ2wmdiqCUcSoqCa+tp8M8wplmiGJlisGwoixPWWHcV1LBvth1w8iMsu
 lZ3KjjmuL5iJXK3IDN0scXyJM+7ZCwRGIiEQ1jv6OpiPHRd+saQVsRyBdVzECGOkJ4Pm
 7bUM+SZXcwWmWtZxycNFZqOtzLBRXWH15uqqTUvP+sAtXEP6SiolfqhLLtGxq2z3YDqT
 N3jw==
X-Gm-Message-State: AOAM533povJb+6oXBoulGUFLJnvjy1nOYSfvmcTmmVGmxwp7XaJL6EIG
 SN7LBIkc+YxKtu3ZYn7y23ezsiky79f2mHiM4hjE+fSIAMuv1pvsq2LPZZV1g8BZqrydjUxBNc3
 h1UzrbhetN/SiXCs=
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr8271147edw.14.1614937460601;
 Fri, 05 Mar 2021 01:44:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzw9GzYxqjdbsYmncaViHoC/QxhuBUdoGFmjrt00QSbdlKziEQD0wv9sDjpy+JjsXXs7UZ+SA==
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr8271140edw.14.1614937460401;
 Fri, 05 Mar 2021 01:44:20 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id q12sm1158694ejd.51.2021.03.05.01.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:44:20 -0800 (PST)
Date: Fri, 5 Mar 2021 10:44:17 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: QEMU RBD is slow with QCOW2 images
Message-ID: <20210305094417.37kiqhxi2ae7hjnf@steredhat>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <20210304120502.GA9607@merkur.fritz.box>
 <20210304140829.4tfdrd2mhqa4o76h@steredhat>
 <20210304145917.GF9607@merkur.fritz.box>
 <20210304173254.3qid3tm26eq6yweg@steredhat>
 <20210305091641.GA5155@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210305091641.GA5155@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Lieven <pl@kamp.de>, Jason Dillaman <dillaman@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 10:16:41AM +0100, Kevin Wolf wrote:
>Am 04.03.2021 um 18:32 hat Stefano Garzarella geschrieben:
>> On Thu, Mar 04, 2021 at 03:59:17PM +0100, Kevin Wolf wrote:
>> > Am 04.03.2021 um 15:08 hat Stefano Garzarella geschrieben:
>> > > On Thu, Mar 04, 2021 at 01:05:02PM +0100, Kevin Wolf wrote:
>> > > > Am 03.03.2021 um 18:40 hat Stefano Garzarella geschrieben:
>> > > > > Hi Jason,
>> > > > > as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
>> > > > > writing data is very slow compared to a raw file.
>> > > > >
>> > > > > Comparing raw vs QCOW2 image creation with RBD I found that we use a
>> > > > > different object size, for the raw file I see '4 MiB objects', for
>> > > > > QCOW2 I
>> > > > > see '64 KiB objects' as reported on comment 14 [2].
>> > > > > This should be the main issue of slowness, indeed forcing in the code 4 MiB
>> > > > > object size also for QCOW2 increased the speed a lot.
>> > > > >
>> > > > > Looking better I discovered that for raw files, we call rbd_create() with
>> > > > > obj_order = 0 (if 'cluster_size' options is not defined), so the default
>> > > > > object size is used.
>> > > > > Instead for QCOW2, we use obj_order = 16, since the default 'cluster_size'
>> > > > > defined for QCOW2, is 64 KiB.
>> > > >
>> > > > Hm, the QemuOpts-based image creation is messy, but why does the rbd
>> > > > driver even see the cluster_size option?
>> > > >
>> > > > The first thing qcow2_co_create_opts() does is splitting the passed
>> > > > QemuOpts into options it will process on the qcow2 layer and options
>> > > > that are passed to the protocol layer. So if you pass a cluster_size
>> > > > option, qcow2 should take it for itself and not pass it to rbd.
>> > > >
>> > > > If it is passed to rbd, I think that's a bug in the qcow2 driver.
>> > >
>> > > IIUC qcow2 properyl remove it, but when rbd uses qemu_opt_get_size_del(opts,
>> > > BLOCK_OPT_CLUSTER_SIZE, 0) the default value of qcow2 format is returned.
>> > >
>> > > Going in depth in qemu_opt_get_size_helper(), I found that qemu_opt_find()
>> > > properly returns a NULL pointer, but then we call find_default_by_name()
>> > > that returns the default value of qcow2 format (64k).
>> >
>> > Ugh, I see why. We're passing the protocol driver a QemuOpts that was
>> > created for a QemuOptsList with the qcow2 default, not for its own
>> > QemuOptsList. This is wrong.
>> >
>> > Note that the QemuOptsList is not qcow2_create_opts itself, but a list
>> > that is created with qemu_opts_append() to combine qcow2 and rbd options
>> > into a new QemuOptsList. For overlapping options, the format wins.
>> >
>> > I don't think you can change the QemuOptsList of an existing QemuOpts,
>> > nor is there a clone operation that could just copy all options into a
>> > new QemuOpts created for the rbd QemuOptsList, so maybe the easiest
>> > hack^Wsolution would be converting to QDict and back...
>>
>> Do you mean something like this? (I'll send a proper patch when everything
>> is a little clearer to me :-)
>>
>> diff --git a/block.c b/block.c
>> index a1f3cecd75..74b02b32dc 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -671,13 +671,33 @@ out:
>>  int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
>>  {
>>      BlockDriver *drv;
>> +    QemuOpts *new_opts;
>> +    QDict *qdict;
>> +    int ret;
>>
>>      drv = bdrv_find_protocol(filename, true, errp);
>>      if (drv == NULL) {
>>          return -ENOENT;
>>      }
>>
>> -    return bdrv_create(drv, filename, opts, errp);
>> +    if (!drv->create_opts) {
>> +        error_setg(errp, "Driver '%s' does not support image creation",
>> +                   drv->format_name);
>> +        return -ENOTSUP;
>> +    }
>> +
>> +    qdict = qemu_opts_to_qdict(opts, NULL);
>> +    new_opts = qemu_opts_from_qdict(drv->create_opts, qdict, errp);
>> +    if (new_opts == NULL) {
>> +        ret = -EINVAL;
>> +        goto out;
>> +    }
>> +
>> +    ret = bdrv_create(drv, filename, new_opts, errp);
>> +out:
>> +    qemu_opts_del(new_opts);
>> +    qobject_unref(qdict);
>> +    return ret;
>>  }
>
>Something like this, yes. Does it work for you?

Yes, I did some testing and only the protocol parameters are passed and 
its defaults.

Thanks for the suggestion!

>
>Of course, in the real patch it could use a comment why we're doing
>these seemingly redundant conversions.

Sure, I'm running some tests to make sure I haven't broken anything. :-)

Thanks,
Stefano


