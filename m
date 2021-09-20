Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBD44115EE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:39:51 +0200 (CEST)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJWQ-0002mp-SQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSJVG-0001IQ-6h
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSJVA-0006ar-Je
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632145110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmabd9frQbLOBnR1dgUx679ZTkAAdTULUOMaxrX8oh0=;
 b=GYyYlXMnUvicI/XeV7rvZQ6QZsm3M30QMSC4GGv3XfwBmn1GaGi8n7hRhaJX2a8cuq2BD8
 adW9dTxnQpdUdTHs/yDjk6Fr2RjlUkbSiDmqKBWTWi93YuGPlwXo4evsaGz0Gsty0gT9s3
 nfoeTZAG4fhtFXyrcUK3IIn9F5b5QRI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-Fh0PC5lXNE6aT4FD4zotvQ-1; Mon, 20 Sep 2021 09:38:29 -0400
X-MC-Unique: Fh0PC5lXNE6aT4FD4zotvQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 e7-20020a50d4c7000000b003d871ecccd8so1712983edj.18
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmabd9frQbLOBnR1dgUx679ZTkAAdTULUOMaxrX8oh0=;
 b=kP+L7Gr+adA/xg4m8vh8D3vCeKzr7egnH2ByNaa4Q4JI/k7XVK1WwAu/QVfqTXF/73
 krqU3o6aTi4BI5JxriWKtX7VJSUQ473jhbbVp2bNOJbjBAZvXYULb1BIE7wRBkIxBJLF
 IqPLkf8LtSO9lXt4G7Exp3V5c6QOJ2E65vcsRtFkIWPpI5AKHtYGd492cOfkYuUqe8mW
 eAqLw8p1ExSuDj7IkA6Tn/+J53hyqO7qo55AphRnkBlrhCdK/0KgHlRnuIedDzyuadp1
 6BJxjXSggClKWsvsxlNSmfLYC5M26yFceo7sejVxoj0v37Mls9UgZycj9OowraZ6J32i
 qDwg==
X-Gm-Message-State: AOAM530SQQSTAblZq5giRF1rz/23wWtmv32h3yoJ4HCBfHHyN++656Xz
 0BI2V80kntvJag+EL/opjV2My2I8WSjZl6oMyg/Be409JxRiI3PuPeGkXSdZWtN58HVMuIO+86X
 5TaJje5WD6nZlPs8=
X-Received: by 2002:a05:6402:698:: with SMTP id
 f24mr28908033edy.48.1632145107483; 
 Mon, 20 Sep 2021 06:38:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCvfVVNtlZ3i7TuTwu0YY6F8JgW2Ot+F7ffOzkGmLHQ9solEzLsCCwoaAKU7OEd+OBOH7DUQ==
X-Received: by 2002:a05:6402:698:: with SMTP id
 f24mr28907996edy.48.1632145107194; 
 Mon, 20 Sep 2021 06:38:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d16sm7035103edu.8.2021.09.20.06.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:38:26 -0700 (PDT)
Date: Mon, 20 Sep 2021 15:38:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v6 02/10] ACPI ERST: specification for ERST support
Message-ID: <20210920153825.70bcaf1a@redhat.com>
In-Reply-To: <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 eblake@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 18:30:31 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Information on the implementation of the ACPI ERST support.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

modulo missing parts documentation looks good to but
I'm tainted at this point (after so many reviews) so
libvirt folks (CCed) can take look at it and see if
something needs to be changed here.

> ---
>  docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 docs/specs/acpi_erst.txt
> 
> diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
> new file mode 100644
> index 0000000..7f7544f
> --- /dev/null
> +++ b/docs/specs/acpi_erst.txt
> @@ -0,0 +1,147 @@
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
> +software and/or hardware fails), pstore may contain information
> +available for post-mortem debugging.
> +
> +Two common storage backends for the pstore filesystem are ACPI ERST
> +and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in all
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
> +Slot 0 is reserved for a backend storage header that identifies the
> +contents as ERST and also facilitates efficient access to the records.
> +Depending upon the size of the backend storage, additional slots will
> +be reserved to be a part of the slot 0 header. For example, at 8KiB,
> +the slot 0 header can accomodate 1024 records. Thus a storage size
> +above 8MiB (8KiB * 1024) requires an additional slot. In this
> +scenario, slot 0 and slot 1 form the backend storage header, and
> +records can be stored starting at slot 2.
> +
> +Below is an example layout of the backend storage format (for storage
> +size less than 8MiB). The size of the storage is a multiple of 8KiB,
> +and contains N number of slots to store records. The example below
> +shows two records (in CPER format) in the backend storage, while the
> +remaining slots are empty/available.
> +
> + Slot   Record
> +        +--------------------------------------------+
> +    0   | reserved: storage header                   |

typically reserved means 'not used', so I'd drop mentioning reserved 
an leave it just as storage header.

Also header format should be described here

> +        +--------------------------------------------+
> +    1   | empty/available                            |
> +        +--------------------------------------------+
> +    2   | CPER                                       |
> +        +--------------------------------------------+

how can one distinguish empty vs used slots (i.e define empty somewhere here)

> +    3   | CPER                                       |
> +        +--------------------------------------------+
> +  ...   |                                            |
> +        +--------------------------------------------+
> +    N   | empty/available                            |
> +        +--------------------------------------------+
> +        <------------------ 8KiB -------------------->
> +
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


