Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD444A9B13
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 15:36:28 +0100 (CET)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFzhL-00054G-Lx
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 09:36:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFzVj-0002iH-St
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:24:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFzVD-0000Sq-Ib
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643984632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CMzzlHwaCMuXSo7wuObOmx3tC7wD26JOU9HVblhZBGE=;
 b=JFQTJKRGjqfHE+sjjY+xYCYy9dawSXsLuulrha53lvxToJ27jkepLH8ALCYc7/2RdQLpsu
 iLRlsmM2t7ZoNoPImjjPBCSqBtw1dHS+5AB0T4LJVUOqP34gIBNSJGoosWF/C/VGLAgJY2
 JTKD5NzIoEc+l2F+hXTx/5FwDY2bqMw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-JxQiCnZBMtm7Xo7f5yVMGg-1; Fri, 04 Feb 2022 09:23:46 -0500
X-MC-Unique: JxQiCnZBMtm7Xo7f5yVMGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso3267172wmh.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 06:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CMzzlHwaCMuXSo7wuObOmx3tC7wD26JOU9HVblhZBGE=;
 b=RBYGexsPtqw45TS+cZ1KCC8QFJP+zYTgDStCffCYz5khriHydmMf3JOY9ve5uwD3Tb
 AT6UsFMaQHJwZ/oNlu4hje64CONX9E2puKGF4csydfKfbErV8j6icJCm/8YvHIO7gzyE
 5PPA4+F/TrqcWy3ORL0Rjk3mYlaV1tzqVM8Y7rGmVRqZ/exVILd6DkAlGoS8qUec/dVT
 7l1n8AQOK9v1+p0GcGHlvZH805tzv9tSlj67XymiPDGIVjaYyfSNF9GxqDW7HDumovb2
 ggXb9sqIo4K2bY6RJorMAOh2GXh37vCbVkFnKViVcv9WpGbQtHTwfZWavvwsU1tdQ4+y
 IW+g==
X-Gm-Message-State: AOAM5323P4wZFdtOtlo9zV76kxIaDYIAYlgjZArN5k4gPeQEuRwD8WPH
 uph6/tOohCAfA+4PkgC+aR1ZJPbTmwyZatpzUvAf4yz6oiREL+NVwiE+yTlewAQG3mvbK+fuqkV
 OuogPv2kHZ2TC8nc=
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr2726426wru.665.1643984625169; 
 Fri, 04 Feb 2022 06:23:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyk3NoizbEVcBxtPbfx+wdOxGhDGfG0zuHB7NEdZv5PY3BvuTEmA7IuS0UVYuK5RpUq7ALFZw==
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr2726391wru.665.1643984624787; 
 Fri, 04 Feb 2022 06:23:44 -0800 (PST)
Received: from redhat.com (bzq-109-65-79-157.red.bezeqint.net. [109.65.79.157])
 by smtp.gmail.com with ESMTPSA id y15sm3099895wry.36.2022.02.04.06.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 06:23:44 -0800 (PST)
Date: Fri, 4 Feb 2022 09:23:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v15 02/10] ACPI ERST: specification for ERST support
Message-ID: <20220204092312-mutt-send-email-mst@kernel.org>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
 <1643402289-22216-3-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1643402289-22216-3-git-send-email-eric.devolder@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 03:38:01PM -0500, Eric DeVolder wrote:
> Information on the implementation of the ACPI ERST support.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> Acked-by: Ani Sinha <ani@anisinha.ca>


Fails build for me:

FAILED: docs/docs.stamp 
env CONFDIR=/usr/local/etc/qemu /usr/bin/sphinx-build-3 -q -W -Dversion=6.2.50 -Drelease= -Ddepfile=docs/docs.d -Ddepfile_stamp=docs/docs.stamp -b html -d /scm/qemu-oot/docs/manual.p /scm/qemu/docs /scm/qemu-oot/docs/manual

Warning, treated as error:
/scm/qemu/docs/specs/acpi_erst.rst:document isn't included in any toctree

I dropped just this patch for now.

> ---
>  docs/specs/acpi_erst.rst | 200 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 200 insertions(+)
>  create mode 100644 docs/specs/acpi_erst.rst
> 
> diff --git a/docs/specs/acpi_erst.rst b/docs/specs/acpi_erst.rst
> new file mode 100644
> index 0000000..a8a9d22
> --- /dev/null
> +++ b/docs/specs/acpi_erst.rst
> @@ -0,0 +1,200 @@
> +ACPI ERST DEVICE
> +================
> +
> +The ACPI ERST device is utilized to support the ACPI Error Record
> +Serialization Table, ERST, functionality. This feature is designed for
> +storing error records in persistent storage for future reference
> +and/or debugging.
> +
> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> +(APEI)", and specifically subsection "Error Serialization", outlines a
> +method for storing error records into persistent storage.
> +
> +The format of error records is described in the UEFI specification[2],
> +in Appendix N "Common Platform Error Record".
> +
> +While the ACPI specification allows for an NVRAM "mode" (see
> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
> +directly exposed for direct access by the OS/guest, this device
> +implements the non-NVRAM "mode". This non-NVRAM "mode" is what is
> +implemented by most BIOS (since flash memory requires programming
> +operations in order to update its contents). Furthermore, as of the
> +time of this writing, Linux only supports the non-NVRAM "mode".
> +
> +
> +Background/Motivation
> +---------------------
> +
> +Linux uses the persistent storage filesystem, pstore, to record
> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> +independent of, and runs before, kdump.  In certain scenarios (ie.
> +hosts/guests with root filesystems on NFS/iSCSI where networking
> +software and/or hardware fails, and thus kdump fails), pstore may
> +contain information available for post-mortem debugging.
> +
> +Two common storage backends for the pstore filesystem are ACPI ERST
> +and UEFI. Most BIOS implement ACPI ERST. UEFI is not utilized in all
> +guests. With QEMU supporting ACPI ERST, it becomes a viable pstore
> +storage backend for virtual machines (as it is now for bare metal
> +machines).
> +
> +Enabling support for ACPI ERST facilitates a consistent method to
> +capture kernel panic information in a wide range of guests: from
> +resource-constrained microvms to very large guests, and in particular,
> +in direct-boot environments (which would lack UEFI run-time services).
> +
> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
> +crash information, if available[3].
> +
> +
> +Configuration|Usage
> +-------------------
> +
> +To use ACPI ERST, a memory-backend-file object and acpi-erst device
> +can be created, for example:
> +
> + qemu ...
> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,size=0x10000,share=on \
> + -device acpi-erst,memdev=erstnvram
> +
> +For proper operation, the ACPI ERST device needs a memory-backend-file
> +object with the following parameters:
> +
> + - id: The id of the memory-backend-file object is used to associate
> +   this memory with the acpi-erst device.
> + - size: The size of the ACPI ERST backing storage. This parameter is
> +   required.
> + - mem-path: The location of the ACPI ERST backing storage file. This
> +   parameter is also required.
> + - share: The share=on parameter is required so that updates to the
> +   ERST backing store are written to the file.
> +
> +and ERST device:
> +
> + - memdev: Is the object id of the memory-backend-file.
> + - record_size: Specifies the size of the records (or slots) in the
> +   backend storage. Must be a power of two value greater than or
> +   equal to 4096 (PAGE_SIZE).
> +
> +
> +PCI Interface
> +-------------
> +
> +The ERST device is a PCI device with two BARs, one for accessing the
> +programming registers, and the other for accessing the record exchange
> +buffer.
> +
> +BAR0 contains the programming interface consisting of ACTION and VALUE
> +64-bit registers.  All ERST actions/operations/side effects happen on
> +the write to the ACTION, by design. Any data needed by the action must
> +be placed into VALUE prior to writing ACTION.  Reading the VALUE
> +simply returns the register contents, which can be updated by a
> +previous ACTION.
> +
> +BAR1 contains the 8KiB record exchange buffer, which is the
> +implemented maximum record size.
> +
> +
> +Backend Storage Format
> +----------------------
> +
> +The backend storage is divided into fixed size "slots", 8KiB in
> +length, with each slot storing a single record.  Not all slots need to
> +be occupied, and they need not be occupied in a contiguous fashion.
> +The ability to clear/erase specific records allows for the formation
> +of unoccupied slots.
> +
> +Slot 0 contains a backend storage header that identifies the contents
> +as ERST and also facilitates efficient access to the records.
> +Depending upon the size of the backend storage, additional slots will
> +be designated to be a part of the slot 0 header. For example, at 8KiB,
> +the slot 0 header can accomodate 1021 records. Thus a storage size
> +of 8MiB (8KiB * 1024) requires an additional slot for use by the
> +header. In this scenario, slot 0 and slot 1 form the backend storage
> +header, and records can be stored starting at slot 2.
> +
> +Below is an example layout of the backend storage format (for storage
> +size less than 8MiB). The size of the storage is a multiple of 8KiB,
> +and contains N number of slots to store records. The example below
> +shows two records (in CPER format) in the backend storage, while the
> +remaining slots are empty/available.
> +
> +::
> +
> + Slot   Record
> +        <------------------ 8KiB -------------------->
> +        +--------------------------------------------+
> +    0   | storage header                             |
> +        +--------------------------------------------+
> +    1   | empty/available                            |
> +        +--------------------------------------------+
> +    2   | CPER                                       |
> +        +--------------------------------------------+
> +    3   | CPER                                       |
> +        +--------------------------------------------+
> +  ...   |                                            |
> +        +--------------------------------------------+
> +    N   | empty/available                            |
> +        +--------------------------------------------+
> +
> +The storage header consists of some basic information and an array
> +of CPER record_id's to efficiently access records in the backend
> +storage.
> +
> +All fields in the header are stored in little endian format.
> +
> +::
> +
> +  +--------------------------------------------+
> +  | magic                                      | 0x0000
> +  +--------------------------------------------+
> +  | record_offset        | record_size         | 0x0008
> +  +--------------------------------------------+
> +  | record_count         | reserved | version  | 0x0010
> +  +--------------------------------------------+
> +  | record_id[0]                               | 0x0018
> +  +--------------------------------------------+
> +  | record_id[1]                               | 0x0020
> +  +--------------------------------------------+
> +  | record_id[...]                             |
> +  +--------------------------------------------+
> +  | record_id[N]                               | 0x1FF8
> +  +--------------------------------------------+
> +
> +The 'magic' field contains the value 0x524F545354535245.
> +
> +The 'record_size' field contains the value 0x2000, 8KiB.
> +
> +The 'record_offset' field points to the first record_id in the array,
> +0x0018.
> +
> +The 'version' field contains 0x0100, the first version.
> +
> +The 'record_count' field contains the number of valid records in the
> +backend storage.
> +
> +The 'record_id' array fields are the 64-bit record identifiers of the
> +CPER record in the corresponding slot. Stated differently, the
> +location of a CPER record_id in the record_id[] array provides the
> +slot index for the corresponding record in the backend storage.
> +
> +Note that, for example, with a backend storage less than 8MiB, slot 0
> +contains the header, so the record_id[0] will never contain a valid
> +CPER record_id. Instead slot 1 is the first available slot and thus
> +record_id_[1] may contain a CPER.
> +
> +A 'record_id' of all 0s or all 1s indicates an invalid record (ie. the
> +slot is available).
> +
> +
> +References
> +----------
> +
> +[1] "Advanced Configuration and Power Interface Specification",
> +    version 4.0, June 2009.
> +
> +[2] "Unified Extensible Firmware Interface Specification",
> +    version 2.1, October 2008.
> +
> +[3] "Windows Hardware Error Architecture", specfically
> +    "Error Record Persistence Mechanism".
> -- 
> 1.8.3.1


