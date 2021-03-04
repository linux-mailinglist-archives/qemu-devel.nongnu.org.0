Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6F32D8A5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:34:18 +0100 (CET)
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrrd-0006TZ-O7
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHrqS-0005xZ-T4
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:33:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHrqQ-0000Oc-6i
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614879180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KTOXsL4evIK5bd/mh+v+segsUsHAAw2dprYWUM9up0A=;
 b=DUKTakUE7XfXGG8WXS4PXDTPTXCdJTx7DiHwq6zCRREP6Hd4YoF1I2GcCRd/cJjR0G3I3T
 GzT56j7pfyiSNj0bMR5B3sVoHbLibEek60X6DCZ9spbGLgFUj8BVbVfiodbyEkGJQQCQJo
 n1Xzu6U5tC8ro6cfNm1xbu1an4Uq3Zw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-BCaYHnAcN6KZyFDB_PdkgQ-1; Thu, 04 Mar 2021 12:32:58 -0500
X-MC-Unique: BCaYHnAcN6KZyFDB_PdkgQ-1
Received: by mail-ed1-f69.google.com with SMTP id q1so14446317edv.5
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:32:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KTOXsL4evIK5bd/mh+v+segsUsHAAw2dprYWUM9up0A=;
 b=HX14wwEc2NWic1EIyEQarXLIHUAq39Aqx2LWZ+jIRmRGdyJfVvfLE/pWa+jvcINqmN
 dXK+37+jLf4bVJspiULcovrchAN8dUvGUsyYnR/YNXNBB2oZ5RXxkuU5Ih81VvVYC21B
 XCuvZbvmADtk2sUM20MtU2LTWY2yn37lYLtUhm3j5BJZxKJzs1/euFibRZUDVJmUi+hM
 AgWy4KnnbQGtE2fyKzPJTdikayRuFwnooCDJ4x9DR4WqW0YVorEGait1ajcdwm7KXhbT
 o/YCoTt4N2krDRnEMhox4NyplQJI6O49bullkv06GGplSWIAxzXLESOaKToBgWKygDJ0
 RIdw==
X-Gm-Message-State: AOAM531ilNdy+4aj7gcHk4Ib9MoV+STQWTHbObigjGKllTx5dedVuakk
 tNlLQYQBHcVg/bo+vtA0zC37yBqUOp/44uo/OHJaDfm1jt5/lZB+iiA73W0NVbG69W6PpGZ8yfw
 TcRsRhmXVYLE/RZg=
X-Received: by 2002:aa7:d0cb:: with SMTP id u11mr5570125edo.163.1614879177511; 
 Thu, 04 Mar 2021 09:32:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw9kZXDbBlW94uuQA+ynN99cCmYlxajlXMmMRytNuwyckomN+GnQ0bWzBcceSjW5lT9UNINA==
X-Received: by 2002:aa7:d0cb:: with SMTP id u11mr5570085edo.163.1614879177166; 
 Thu, 04 Mar 2021 09:32:57 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id i18sm23859089edt.68.2021.03.04.09.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 09:32:56 -0800 (PST)
Date: Thu, 4 Mar 2021 18:32:54 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: QEMU RBD is slow with QCOW2 images
Message-ID: <20210304173254.3qid3tm26eq6yweg@steredhat>
References: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
 <20210304120502.GA9607@merkur.fritz.box>
 <20210304140829.4tfdrd2mhqa4o76h@steredhat>
 <20210304145917.GF9607@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210304145917.GF9607@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Mar 04, 2021 at 03:59:17PM +0100, Kevin Wolf wrote:
>Am 04.03.2021 um 15:08 hat Stefano Garzarella geschrieben:
>> On Thu, Mar 04, 2021 at 01:05:02PM +0100, Kevin Wolf wrote:
>> > Am 03.03.2021 um 18:40 hat Stefano Garzarella geschrieben:
>> > > Hi Jason,
>> > > as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD
>> > > writing data is very slow compared to a raw file.
>> > >
>> > > Comparing raw vs QCOW2 image creation with RBD I found that we use a
>> > > different object size, for the raw file I see '4 MiB objects', for
>> > > QCOW2 I
>> > > see '64 KiB objects' as reported on comment 14 [2].
>> > > This should be the main issue of slowness, indeed forcing in the code 4 MiB
>> > > object size also for QCOW2 increased the speed a lot.
>> > >
>> > > Looking better I discovered that for raw files, we call rbd_create() with
>> > > obj_order = 0 (if 'cluster_size' options is not defined), so the default
>> > > object size is used.
>> > > Instead for QCOW2, we use obj_order = 16, since the default 'cluster_size'
>> > > defined for QCOW2, is 64 KiB.
>> >
>> > Hm, the QemuOpts-based image creation is messy, but why does the rbd
>> > driver even see the cluster_size option?
>> >
>> > The first thing qcow2_co_create_opts() does is splitting the passed
>> > QemuOpts into options it will process on the qcow2 layer and options
>> > that are passed to the protocol layer. So if you pass a cluster_size
>> > option, qcow2 should take it for itself and not pass it to rbd.
>> >
>> > If it is passed to rbd, I think that's a bug in the qcow2 driver.
>>
>> IIUC qcow2 properyl remove it, but when rbd uses qemu_opt_get_size_del(opts,
>> BLOCK_OPT_CLUSTER_SIZE, 0) the default value of qcow2 format is returned.
>>
>> Going in depth in qemu_opt_get_size_helper(), I found that qemu_opt_find()
>> properly returns a NULL pointer, but then we call find_default_by_name()
>> that returns the default value of qcow2 format (64k).
>
>Ugh, I see why. We're passing the protocol driver a QemuOpts that was
>created for a QemuOptsList with the qcow2 default, not for its own
>QemuOptsList. This is wrong.
>
>Note that the QemuOptsList is not qcow2_create_opts itself, but a list
>that is created with qemu_opts_append() to combine qcow2 and rbd options
>into a new QemuOptsList. For overlapping options, the format wins.
>
>I don't think you can change the QemuOptsList of an existing QemuOpts,
>nor is there a clone operation that could just copy all options into a
>new QemuOpts created for the rbd QemuOptsList, so maybe the easiest
>hack^Wsolution would be converting to QDict and back...

Do you mean something like this? (I'll send a proper patch when 
everything is a little clearer to me :-)

diff --git a/block.c b/block.c
index a1f3cecd75..74b02b32dc 100644
--- a/block.c
+++ b/block.c
@@ -671,13 +671,33 @@ out:
  int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
  {
      BlockDriver *drv;
+    QemuOpts *new_opts;
+    QDict *qdict;
+    int ret;

      drv = bdrv_find_protocol(filename, true, errp);
      if (drv == NULL) {
          return -ENOENT;
      }

-    return bdrv_create(drv, filename, opts, errp);
+    if (!drv->create_opts) {
+        error_setg(errp, "Driver '%s' does not support image creation",
+                   drv->format_name);
+        return -ENOTSUP;
+    }
+
+    qdict = qemu_opts_to_qdict(opts, NULL);
+    new_opts = qemu_opts_from_qdict(drv->create_opts, qdict, errp);
+    if (new_opts == NULL) {
+        ret = -EINVAL;
+        goto out;
+    }
+
+    ret = bdrv_create(drv, filename, new_opts, errp);
+out:
+    qemu_opts_del(new_opts);
+    qobject_unref(qdict);
+    return ret;
  }

>
>> > > Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster
>> > > size, since in qcow2_co_create_opts() we remove the 'cluster_size' from
>> > > QemuOpts calling qemu_opts_to_qdict_filtered().
>> > > For some reason that I have yet to understand, after this deletion, however
>> > > remains in QemuOpts the default value of 'cluster_size' for qcow2 (64 KiB),
>> > > that it's used in qemu_rbd_co_create_opts()
>> >
>> > So it seems you came to a similar conclusion. We need to find out where
>> > the 64k come from and just fix that so that rbd uses its default.
>>
>> Yes, I tried debugging above, but I'm not sure how to fix it.
>>
>> Maybe a new parameter in qemu_opt_get_size_helper() to prevent it from
>> looking for the default value.
>> Or we should prevent the default value from being added to the
>> opts->list->desc, but that part is still not very clear to me.
>
>opts->list is already wrong, I think this is what we need to fix.
>
>> > > At this point my doubts are:
>> > > Does it make sense to use the same cluster_size as qcow2 as object_size in
>> > > RBD?
>> > > If we want to keep the 2 options separated, how can it be done?  
>> > > Should we
>> > > rename the option in block/rbd.c?
>> >
>> > My lazy answer is that you could just use QMP blockdev-create, where you
>> > create layer by layer separately.
>> >
>> > What could possibly be done for the QemuOpts is using the dotted syntax
>> > like for opening, so you could specify file.cluster_size=... for the
>> > protocol layer (or data_file.cluster_size=... for the external data
>> > file etc.)
>>
>> This would be cool :-)
>
>I'm almost sure that compatibility will make this more complicated than
>it sounds, but we could have a try.

Eheh I see your point.

Thanks,
Stefano


