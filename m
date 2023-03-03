Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113EE6A9AE0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:43:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7Ym-0007Nz-9P; Fri, 03 Mar 2023 10:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pY7Yk-0007Nb-Mv
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:43:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pY7Yi-0005mi-R6
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677858179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9A0Am/dKD190Pd1oBn5DOOkj66Pw2239pLo8DA1VPq0=;
 b=V67Zz6tvrsbAIhCQcE6hUt7HGg1gnRFP2tFByEJM2ZUrZh0LYp00AJwiOoZYayOpoWIDTR
 INgrw0QwF97YVfhf0uFVmsVU6kTZEnvqc8ZslLtw7vln03A7ZI3YlVWMvTEVrIeD9xMOUs
 epe1bdXuO5+NlR2vMATavgFDXMiDjRY=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-zDBIBnjQM8a-UCCqKzfyPA-1; Fri, 03 Mar 2023 10:42:58 -0500
X-MC-Unique: zDBIBnjQM8a-UCCqKzfyPA-1
Received: by mail-il1-f199.google.com with SMTP id
 d3-20020a056e02050300b00317999dcfb1so1540590ils.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 07:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9A0Am/dKD190Pd1oBn5DOOkj66Pw2239pLo8DA1VPq0=;
 b=fnBY88CRjzMek75SI9KS/PJnO1sqSfMEr+cf40Ynh2SUl9yVG5Iv00affhQenX0lU4
 ICFWgAFt0PR+8QsOAHLiEwCuNPVgfqmx7v/TU536zHcjg/1x1W8/Qc2MT0Xv8AQUo1s2
 p9y/dghhsk6mfaq7hfLutK9cuCdy41zR8pcWEwAKyRdi6o+WoAYrKcmzFMo4oul3uLzM
 vu0skZQCzXrmKLSq3ry7PR9M1icTbku8iGqe0vonGLhI6/41DBj983V/aTAicYCgqRvB
 63edx7QudPT1kKjEyh4svCp1q+EiJltVJU9a2YQA12rG9qPT2BV5ev1NJ6fFPGNu6FiF
 Y9Nw==
X-Gm-Message-State: AO0yUKXayoXZg6NuHNRblb/kz2CBcTncxuqpyloOXYXfsmYsfIsvu8oe
 CJE6fX6Om3F9xsJjEa/HoNi8gs9oA5BOudAM/Egy9hu0YEneSbiRFdZE0f32wlG8KMaqGoXI0pb
 mI4DZ7l4tHVzEgxI=
X-Received: by 2002:a05:6e02:1c29:b0:315:4449:cb50 with SMTP id
 m9-20020a056e021c2900b003154449cb50mr1682078ilh.16.1677858177623; 
 Fri, 03 Mar 2023 07:42:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9csl1ooha4V9g+AZl71bBF+Wa9ImP2N4LrLOioOB4sgE0bS9K7P+EJ4vAwB60IQC26hHqLfA==
X-Received: by 2002:a05:6e02:1c29:b0:315:4449:cb50 with SMTP id
 m9-20020a056e021c2900b003154449cb50mr1682069ilh.16.1677858177375; 
 Fri, 03 Mar 2023 07:42:57 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v8-20020a02cba8000000b003ba4aea63d1sm764898jap.117.2023.03.03.07.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 07:42:56 -0800 (PST)
Date: Fri, 3 Mar 2023 08:42:55 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v2] vfio: Fix vfio_get_dev_region() trace event
Message-ID: <20230303084255.2fe5f26c.alex.williamson@redhat.com>
In-Reply-To: <93a2b734-d3b1-27e8-32f4-d46342dc6b00@linaro.org>
References: <20230303074330.2609377-1-clg@kaod.org>
 <93a2b734-d3b1-27e8-32f4-d46342dc6b00@linaro.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 3 Mar 2023 10:34:47 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 3/3/23 08:43, C=C3=A9dric Le Goater wrote:
> > From: C=C3=A9dric Le Goater <clg@redhat.com>
> >=20
> > Simply revert 'x8' to fix the typo and remove the ending '8'

s/revert/reverse/?  ie. transpose?  Nothing is being reverted afaict.

> >=20
> > Fixes: e61a424f05 ("vfio: Create device specific region info helper")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1526
> > Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> > ---
> >   hw/vfio/trace-events | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> > index 669d9fe07c..28e82541a2 100644
> > --- a/hw/vfio/trace-events
> > +++ b/hw/vfio/trace-events
> > @@ -117,7 +117,7 @@ vfio_region_mmaps_set_enabled(const char *name, boo=
l enabled) "Region %s mmaps e
> >   vfio_region_unmap(const char *name, unsigned long offset, unsigned lo=
ng end) "Region %s unmap [0x%lx - 0x%lx]"
> >   vfio_region_sparse_mmap_header(const char *name, int index, int nr_ar=
eas) "Device %s region %d: %d sparse mmap entries"
> >   vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned lo=
ng end) "sparse entry %d [0x%lx - 0x%lx]"
> > -vfio_get_dev_region(const char *name, int index, uint32_t type, uint32=
_t subtype) "%s index %d, %08x/%0x8"
> > +vfio_get_dev_region(const char *name, int index, uint32_t type, uint32=
_t subtype) "%s index %d, %08x/%08x" =20
>=20
> 8 digits might be over-engineered, but at least is future-proof :)
>=20
> $ git grep -E 'VFIO_REGION_(SUB)?TYPE_' linux-headers/
> linux-headers/linux/vfio.h:322:#define VFIO_REGION_TYPE_PCI_VENDOR_TYPE=20
> (1 << 31)

This alone justifies printing the full zero-prefixed hex value.  I tend
to prefer fixed width fields in trace logs, though it's less important
here than when we're streaming register accesses.  Thanks,

Alex


