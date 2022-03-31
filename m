Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DE74ED7AD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:14:50 +0200 (CEST)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrpJ-0000Bk-0n
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:14:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZrl2-000654-1I
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZrku-0004GG-Vm
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648721415;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pVxeMOa95IdmC4peAurQu7PzuxTKPmKbEGn3paZn5Vg=;
 b=Mu2G7MeIefWw5hubemdg6+laA/L6g7XhVDBnRgkRE6sqW0VbzZmYX74AzM5yqX/mbBZ1vp
 XgI8LkQT0RA+KHj1rAyyvVv+D9oH7V6uMUGQe5MRXqtBX3Q6ImAB8UTfE8FktxLH4MnhLy
 bqueMoKiPckHPy01rvjNa8Bn3M76QqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-r56N2G5JNF-kGokWKGmWkA-1; Thu, 31 Mar 2022 06:10:08 -0400
X-MC-Unique: r56N2G5JNF-kGokWKGmWkA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D863800B28;
 Thu, 31 Mar 2022 10:10:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3EC5D9A5D;
 Thu, 31 Mar 2022 10:10:06 +0000 (UTC)
Date: Thu, 31 Mar 2022 11:10:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PULL 5/7] hw: convert the escc device to
 keycodemapdb
Message-ID: <YkV9/OLeaOmKrXzR@redhat.com>
References: <20180129102320.21534-1-kraxel@redhat.com>
 <20180129102320.21534-6-kraxel@redhat.com>
 <CAFEAcA_rDF-6=-S--F-NU_Q-YaZSKw1f6GvKekayuYviQv0ebA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rDF-6=-S--F-NU_Q-YaZSKw1f6GvKekayuYviQv0ebA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:03:49AM +0100, Peter Maydell wrote:
> On Mon, 29 Jan 2018 at 10:24, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > From: "Daniel P. Berrange" <berrange@redhat.com>
> >
> > Replace the qcode_to_keycode table with automatically
> > generated tables.
> >
> > Missing entries in qcode_to_keycode now fixed:
> >
> >  - Q_KEY_CODE_KP_COMMA -> 0x2d
> >
> > Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> > Message-id: 20180117164118.8510-3-berrange@redhat.com
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> > @@ -879,7 +759,11 @@ static void sunkbd_handle_event(DeviceState *dev, QemuConsole *src,
> >          }
> >      }
> >
> > -    keycode = qcode_to_keycode[qcode];
> > +    if (qcode > qemu_input_map_qcode_to_sun_len) {
> > +        return;
> > +    }
> > +
> > +    keycode = qemu_input_map_qcode_to_sun[qcode];
> >      if (!key->down) {
> >          keycode |= 0x80;
> >      }
> 
> Hi; I was looking at this code because Coverity is now clever enough
> to try to check whether the qemu_input_map_qcode_to_sun[] array
> is being overrun (though alas not clever enough to spot that
> qemu_input_map_qcode_to_sun_len is the length of that array,
> so there are false positive complaints about all the uses of these
> autogenerated arrays in all devices that use them).
> 
> In this specific case, though, it does look like there's a bug:
> shouldn't the condition be "if (qcode >= qemu_input_map_qcode_to_sun_len)" ?

Yes, you are right.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


