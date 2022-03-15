Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411544DA56E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 23:29:44 +0100 (CET)
Received: from localhost ([::1]:45188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUFfi-0001oc-QO
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 18:29:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nUFeV-00018H-Bu
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 18:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nUFeT-0007fx-FH
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 18:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647383304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qm+uFuNG6wn1Me7iHf4qsqNgdja4P4JhoztTUc0YLag=;
 b=Rm8oEuAOCBBJHzyZLn/oYaeCNZfXd0GblKLtbIwfXDxX4i8afraF54ghtMS+c+zMW862ak
 4qeZwK8r+YPA6DOaxUPY5sVFfUDkBM54jxKAiX0ccet51i1C9XWOTdDSpG1H9Br5jBPS/3
 WTMZbJpfmUKBw996Cq7RihqWHCHqqdI=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-nK1OeeheMjio-p6o--mDpg-1; Tue, 15 Mar 2022 18:28:20 -0400
X-MC-Unique: nK1OeeheMjio-p6o--mDpg-1
Received: by mail-oo1-f72.google.com with SMTP id
 n14-20020a4a848e000000b00320fa3f046cso295003oog.23
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 15:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=qm+uFuNG6wn1Me7iHf4qsqNgdja4P4JhoztTUc0YLag=;
 b=bsyYO/+FXWaenLpUX4WhCZLLxvpOaREjoooXEBqL/P08g6lrx0NLWLpQIYrKvhOpfF
 3zGu/HuxAtso7Us5fKLL23PTskvMf5OtXxE5wMlpilAGre+6xM5eLi98y0Y20MBow2t1
 sBy34frV85ld+PxTyDzqSIme6Nm730Xy8yNvBOcRPyAHuU3G2VeBu/EDdhbIL7wAqUsx
 3h66QEXbzPlcYCMAXfD4520XC9pbcZd0MhSvTSi92BZKa9sPSwlKDmNKUhS+8YVVPQAw
 V/U+kKnDdML1Wn+MLnBRYLOcyyaazOs27N3MRROyj1SPMQgpdtg8TNogJ2fmLDD7neTL
 qOMg==
X-Gm-Message-State: AOAM532oKvgFQQCEYrJmWPLTwANvX8rri6ANqreC8o+W2zFjxLn/BtyZ
 YiTfwq639unpYekb7dAQJEr+LqOHP1Dou442iRddGaSO+svMwEniQP3+283I3F2wEGj9tSVuR21
 Bo4BFlF5NMjsRFyg=
X-Received: by 2002:a05:6870:328c:b0:da:4485:ec72 with SMTP id
 q12-20020a056870328c00b000da4485ec72mr2450905oac.155.1647383299260; 
 Tue, 15 Mar 2022 15:28:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjXejGkkwH5pa5QrKNdLPFSdmzfbBLmcpr7zRFtKBkcZx5dpEi4irhit1DbVAEytH3RxfhUA==
X-Received: by 2002:a05:6870:328c:b0:da:4485:ec72 with SMTP id
 q12-20020a056870328c00b000da4485ec72mr2450900oac.155.1647383299024; 
 Tue, 15 Mar 2022 15:28:19 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 bb39-20020a05680816a700b002d9a8eb89fasm203034oib.46.2022.03.15.15.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 15:28:18 -0700 (PDT)
Date: Tue, 15 Mar 2022 16:28:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Message-ID: <20220315162817.3401a804.alex.williamson@redhat.com>
In-Reply-To: <DM8PR02MB8005ACC7B26833CC47F9101B8B109@DM8PR02MB8005.namprd02.prod.outlook.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a9b696ca38ee2329e371c28bcaa2921cac2a48a2.1641584316.git.john.g.johnson@oracle.com>
 <20220309153453.25eee9dd.alex.williamson@redhat.com>
 <DM8PR02MB8005ACC7B26833CC47F9101B8B109@DM8PR02MB8005.namprd02.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: John Johnson <john.g.johnson@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <john.levon@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 21:43:15 +0000
Thanos Makatos <thanos.makatos@nutanix.com> wrote:

> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-  
> > bounces+thanos.makatos=nutanix.com@nongnu.org> On Behalf Of Alex  
> > Williamson
> > Sent: 09 March 2022 22:35
> > To: John Johnson <john.g.johnson@oracle.com>
> > Cc: qemu-devel@nongnu.org
> > Subject: Re: [RFC v4 01/21] vfio-user: introduce vfio-user protocol specification
> > 
> > On Tue, 11 Jan 2022 16:43:37 -0800
> > John Johnson <john.g.johnson@oracle.com> wrote:  
> > > +VFIO region info cap sparse mmap
> > > +""""""""""""""""""""""""""""""""
> > > +
> > > ++----------+--------+------+
> > > +| Name     | Offset | Size |
> > > ++==========+========+======+
> > > +| nr_areas | 0      | 4    |
> > > ++----------+--------+------+
> > > +| reserved | 4      | 4    |
> > > ++----------+--------+------+
> > > +| offset   | 8      | 8    |
> > > ++----------+--------+------+
> > > +| size     | 16     | 9    |
> > > ++----------+--------+------+  
> > 
> > Typo, I'm pretty sure size isn't 9 bytes.
> >   
> > > +| ...      |        |      |
> > > ++----------+--------+------+
> > > +
> > > +* *nr_areas* is the number of sparse mmap areas in the region.
> > > +* *offset* and size describe a single area that can be mapped by the client.
> > > +  There will be *nr_areas* pairs of offset and size. The offset will be added to
> > > +  the base offset given in the ``VFIO_USER_DEVICE_GET_REGION_INFO`` to  
> > form the  
> > > +  offset argument of the subsequent mmap() call.
> > > +
> > > +The VFIO sparse mmap area is defined in ``<linux/vfio.h>`` (``struct
> > > +vfio_region_info_cap_sparse_mmap``).
> > > +
> > > +VFIO region type cap header
> > > +"""""""""""""""""""""""""""
> > > +
> > > ++------------------+---------------------------+
> > > +| Name             | Value                     |
> > > ++==================+===========================+
> > > +| id               | VFIO_REGION_INFO_CAP_TYPE |
> > > ++------------------+---------------------------+
> > > +| version          | 0x1                       |
> > > ++------------------+---------------------------+
> > > +| next             | <next>                    |
> > > ++------------------+---------------------------+
> > > +| region info type | VFIO region info type     |
> > > ++------------------+---------------------------+
> > > +
> > > +This capability is defined when a region is specific to the device.
> > > +
> > > +VFIO region info type cap
> > > +"""""""""""""""""""""""""
> > > +
> > > +The VFIO region info type is defined in ``<linux/vfio.h>``
> > > +(``struct vfio_region_info_cap_type``).
> > > +
> > > ++---------+--------+------+
> > > +| Name    | Offset | Size |
> > > ++=========+========+======+
> > > +| type    | 0      | 4    |
> > > ++---------+--------+------+
> > > +| subtype | 4      | 4    |
> > > ++---------+--------+------+
> > > +
> > > +The only device-specific region type and subtype supported by vfio-user is
> > > +``VFIO_REGION_TYPE_MIGRATION`` (3) and  
> > ``VFIO_REGION_SUBTYPE_MIGRATION`` (1).
> > 
> > These should be considered deprecated from the kernel interface.  I
> > hope there are plans for vfio-user to adopt the new interface that's
> > currently available in linux-next and intended for v5.18.
> > 
> > ...  
> > > +Unused VFIO ``ioctl()`` commands
> > > +--------------------------------
> > > +
> > > +The following VFIO commands do not have an equivalent vfio-user  
> > command:  
> > > +
> > > +* ``VFIO_GET_API_VERSION``
> > > +* ``VFIO_CHECK_EXTENSION``
> > > +* ``VFIO_SET_IOMMU``
> > > +* ``VFIO_GROUP_GET_STATUS``
> > > +* ``VFIO_GROUP_SET_CONTAINER``
> > > +* ``VFIO_GROUP_UNSET_CONTAINER``
> > > +* ``VFIO_GROUP_GET_DEVICE_FD``
> > > +* ``VFIO_IOMMU_GET_INFO``
> > > +
> > > +However, once support for live migration for VFIO devices is finalized some
> > > +of the above commands may have to be handled by the client in their
> > > +corresponding vfio-user form. This will be addressed in a future protocol
> > > +version.  
> > 
> > As above, I'd go ahead and drop the migration region interface support,
> > it's being removed from the kernel.  Dirty page handling might also be
> > something you want to pull back on as we're expecting in-kernel vfio to
> > essentially deprecate its iommu backends in favor of a new shared
> > userspace iommufd interface.  We expect to have backwards compatibility
> > via that interface, but as QEMU migration support for vfio-pci devices
> > is experimental and there are desires not to consolidate dirty page
> > tracking behind the iommu interface in the new model, it's not clear if
> > the kernel will continue to expose the current dirty page tracking.
> > 
> > AIUI, we're expecting to see patches officially proposing the iommufd
> > interface in the kernel "soon".  Thanks,  
> 
> Are you referring to the "[RFC v2] /dev/iommu uAPI proposal" work (https://lkml.org/lkml/2021/7/9/89)?

There's a more recent proposal here:

https://lore.kernel.org/all/20210919063848.1476776-1-yi.l.liu@intel.com/

But I suspect based on discussions that it's evolved quite a lot since
then.  Based on various test robot reports, I gather the current
pre-release is tracking in Yi's tree here:

https://github.com/luxis1999/iommufd

Thanks,

Alex


