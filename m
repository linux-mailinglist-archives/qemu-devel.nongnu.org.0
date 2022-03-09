Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964884D3D14
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 23:36:01 +0100 (CET)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS4uW-0001Rz-5N
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 17:36:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nS4tb-0000nR-Fx
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 17:35:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nS4tX-0002K1-Pe
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 17:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646865297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ln7BYK4FOW5todCisNllt3WsfuG9MlnUd+RENHWamPU=;
 b=CsdZjf7bda/j50SG5boMQNAmHINfxrTQ58+XA7qFXGaufClJtzCxZm5De2aTgGJ2DzTwI2
 lLVnYbmbqc2IKeAADLND7cQRfdLHx+f3tYerXq8sF5hG+2aLkfmsr8yXIbZDZcATti3qJV
 fTkqWtmr6wTzDxUzQLuhG9lUMKF5xE0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-0aU2vH7fMByED7no883_Sw-1; Wed, 09 Mar 2022 17:34:56 -0500
X-MC-Unique: 0aU2vH7fMByED7no883_Sw-1
Received: by mail-oo1-f72.google.com with SMTP id
 185-20020a4a1dc2000000b0031c074ab4b1so2789940oog.14
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 14:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Ln7BYK4FOW5todCisNllt3WsfuG9MlnUd+RENHWamPU=;
 b=oHbQExSLQhujuBNJ2SFa+Cx6QCLUADiVrmkak9O/ef3IyIFiQeZQcBvk8AwHV673hC
 +eDsB6wEFJ67sAyL8GfLYBsqrJtDgYcFF/+aMtGbVj+SkjGR5FSV/jXk8ipM9P8LQw0F
 lX8bZh+QtvnAUsPkhUi3YnW0lCmGVj7dregitrDJ8ZCyerjw1XsiOg5492b/IRhgEq7c
 CYVr3JggvsjRY485cBV8nzfz1pUUBrVHVhd8hFo/5o4tuW+AKdV8ZgSaef6j2WklY3pu
 10jEQVi8iQpR9k8O94DY8LuMgD+O4BpEi0fAyRLE2O0G8FQQyXO/Hv63yWKNXOibwjt3
 xkiw==
X-Gm-Message-State: AOAM5324jf9Q22IT27BrhsETYUmMkhcjpr074h+aCsJ1efbkUb9seB6H
 6xPI6OZMnCuxv9M0anijV4yDsEcm9P1zBkPCLCiPDZK19J2dQJ4X6MU/Ch7vbDKAFFFDnYiMnfk
 oD6V6VQ+eEK/Fh9E=
X-Received: by 2002:a05:6871:69f:b0:da:294e:2de4 with SMTP id
 l31-20020a056871069f00b000da294e2de4mr6678728oao.123.1646865295989; 
 Wed, 09 Mar 2022 14:34:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCUwnIZQkre3J/DMq+V0OY4udqtL4Uwxw1osydSps2+a+hH+yBYmCyH8YJa6hJUmPSitYTag==
X-Received: by 2002:a05:6871:69f:b0:da:294e:2de4 with SMTP id
 l31-20020a056871069f00b000da294e2de4mr6678710oao.123.1646865295627; 
 Wed, 09 Mar 2022 14:34:55 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y128-20020acae186000000b002d97bda3873sm1618638oig.56.2022.03.09.14.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 14:34:55 -0800 (PST)
Date: Wed, 9 Mar 2022 15:34:53 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Message-ID: <20220309153453.25eee9dd.alex.williamson@redhat.com>
In-Reply-To: <a9b696ca38ee2329e371c28bcaa2921cac2a48a2.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a9b696ca38ee2329e371c28bcaa2921cac2a48a2.1641584316.git.john.g.johnson@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 16:43:37 -0800
John Johnson <john.g.johnson@oracle.com> wrote:
> +VFIO region info cap sparse mmap
> +""""""""""""""""""""""""""""""""
> +
> ++----------+--------+------+
> +| Name     | Offset | Size |
> ++==========+========+======+
> +| nr_areas | 0      | 4    |
> ++----------+--------+------+
> +| reserved | 4      | 4    |
> ++----------+--------+------+
> +| offset   | 8      | 8    |
> ++----------+--------+------+
> +| size     | 16     | 9    |
> ++----------+--------+------+

Typo, I'm pretty sure size isn't 9 bytes.

> +| ...      |        |      |
> ++----------+--------+------+
> +
> +* *nr_areas* is the number of sparse mmap areas in the region.
> +* *offset* and size describe a single area that can be mapped by the client.
> +  There will be *nr_areas* pairs of offset and size. The offset will be added to
> +  the base offset given in the ``VFIO_USER_DEVICE_GET_REGION_INFO`` to form the
> +  offset argument of the subsequent mmap() call.
> +
> +The VFIO sparse mmap area is defined in ``<linux/vfio.h>`` (``struct
> +vfio_region_info_cap_sparse_mmap``).
> +
> +VFIO region type cap header
> +"""""""""""""""""""""""""""
> +
> ++------------------+---------------------------+
> +| Name             | Value                     |
> ++==================+===========================+
> +| id               | VFIO_REGION_INFO_CAP_TYPE |
> ++------------------+---------------------------+
> +| version          | 0x1                       |
> ++------------------+---------------------------+
> +| next             | <next>                    |
> ++------------------+---------------------------+
> +| region info type | VFIO region info type     |
> ++------------------+---------------------------+
> +
> +This capability is defined when a region is specific to the device.
> +
> +VFIO region info type cap
> +"""""""""""""""""""""""""
> +
> +The VFIO region info type is defined in ``<linux/vfio.h>``
> +(``struct vfio_region_info_cap_type``).
> +
> ++---------+--------+------+
> +| Name    | Offset | Size |
> ++=========+========+======+
> +| type    | 0      | 4    |
> ++---------+--------+------+
> +| subtype | 4      | 4    |
> ++---------+--------+------+
> +
> +The only device-specific region type and subtype supported by vfio-user is
> +``VFIO_REGION_TYPE_MIGRATION`` (3) and ``VFIO_REGION_SUBTYPE_MIGRATION`` (1).

These should be considered deprecated from the kernel interface.  I
hope there are plans for vfio-user to adopt the new interface that's
currently available in linux-next and intended for v5.18.

...
> +Unused VFIO ``ioctl()`` commands
> +--------------------------------
> +
> +The following VFIO commands do not have an equivalent vfio-user command:
> +
> +* ``VFIO_GET_API_VERSION``
> +* ``VFIO_CHECK_EXTENSION``
> +* ``VFIO_SET_IOMMU``
> +* ``VFIO_GROUP_GET_STATUS``
> +* ``VFIO_GROUP_SET_CONTAINER``
> +* ``VFIO_GROUP_UNSET_CONTAINER``
> +* ``VFIO_GROUP_GET_DEVICE_FD``
> +* ``VFIO_IOMMU_GET_INFO``
> +
> +However, once support for live migration for VFIO devices is finalized some
> +of the above commands may have to be handled by the client in their
> +corresponding vfio-user form. This will be addressed in a future protocol
> +version.

As above, I'd go ahead and drop the migration region interface support,
it's being removed from the kernel.  Dirty page handling might also be
something you want to pull back on as we're expecting in-kernel vfio to
essentially deprecate its iommu backends in favor of a new shared
userspace iommufd interface.  We expect to have backwards compatibility
via that interface, but as QEMU migration support for vfio-pci devices
is experimental and there are desires not to consolidate dirty page
tracking behind the iommu interface in the new model, it's not clear if
the kernel will continue to expose the current dirty page tracking.

AIUI, we're expecting to see patches officially proposing the iommufd
interface in the kernel "soon".  Thanks,

Alex


