Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20943C7314
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:21:21 +0200 (CEST)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KDo-0007ho-Ue
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3KC7-0006Ld-Lx
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3KC6-000716-5E
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YlFGUQSaxxsC+MXy2HfMTU88Be6e6j3XHhhQWnCuk9s=;
 b=EYPjzISQx81nn4XqV8LU2+w1iNjkcpdX6d6igEAbf9n4fVdskd7qLkk+a9LuIyEjuLMDu5
 bJfz3DK1shkCvHnoOjOO94ux0DZ9MTBpHs0P5fjwejhtywEhMcK+oWLQ97U2j/nZqPbBU8
 OK32dIn0c+q58b4twg04a1f898C7cYY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-nPVFfRjdO4OfJubGzSld6Q-1; Tue, 13 Jul 2021 11:19:31 -0400
X-MC-Unique: nPVFfRjdO4OfJubGzSld6Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so7696558wrc.14
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YlFGUQSaxxsC+MXy2HfMTU88Be6e6j3XHhhQWnCuk9s=;
 b=H+9rWQEvdr+bH9aIs2EcjKsc1dVbc+Fj39I7eddmcvSqUph4AUYyPxBqG+wzfQXK87
 cT4G1KejBq99t7V2ro6qKmG3ETb91v5lOaOkcjB3VHHJhMmwBKf3NHb3n9wD3GLB4Mif
 NrgdxQg17HezmyKhlY4iCXeUL/vFJkLb5A2fNnOJSZl/3l5XBe7B3tX05YGHwASvLBZ4
 C2NNx+F5KwA4Ka9GVsoXSvnwSheIT2JQuqUDhp6ejenCC67aFXlO8Lup2r/qXisiE4hJ
 8v/60MFu+eXP5l2sUIvXjueJtalj2en4lxG3gUwPpx38RiMtfNMMrNsmQRqLL/r/Pgzj
 VBEQ==
X-Gm-Message-State: AOAM530IEQQuZ0Qy6Lp6YM8NiQvhF5WOagcyIX5uNQQA/kUQfVEv+JgD
 9OFgXu+Gm9U0dlhH3//9BjTFKwIXwIzgK2ZXk4FWSnwz8tKMIeF59112aaV7aBp2F9k7VkH30kx
 g30bRmXEGe9plQ6k=
X-Received: by 2002:a7b:c934:: with SMTP id h20mr5665169wml.59.1626189570669; 
 Tue, 13 Jul 2021 08:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwePcEpabgqHx1yJybeKLNBL9RHcjReozLVLr+DHOqEmWY37+loxd0TAbjX/JEY3EWJv38pfA==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr5665150wml.59.1626189570454; 
 Tue, 13 Jul 2021 08:19:30 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id c15sm1990241wmr.28.2021.07.13.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:19:28 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:19:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 00/10] tests: Add test cases for TPM 1.2 ACPI tables
Message-ID: <20210713111900-mutt-send-email-mst@kernel.org>
References: <20210712204736.365349-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210712204736.365349-1-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 04:47:26PM -0400, Stefan Berger wrote:
> This series of patches adds test case for TPM 1.2 ACPI tables.


Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls feel free to merge through tpm tree.

>   Stefan
> 
> v4:
>   - Added patch 10 that checks for availability of a TPM device model
>     using QMP and if not available skips the ACPI table test
> 
> v3:
>   - Define enum TPMVersion for when CONFIG_TPM is not defined
>     affected patches 2 and 6
> 
> v2:
>   - Proper handling of renaming of files holding expected ACPI data
> 
> 
> Stefan Berger (10):
>   tests: Rename TestState to TPMTestState
>   tests: Add tpm_version field to TPMTestState and fill it
>   tests: acpi: Prepare for renaming of TPM2 related ACPI files
>   tests: Add suffix 'tpm2' or 'tpm12' to ACPI table files
>   tests: acpi: tpm2: Add the renamed ACPI files and drop old ones
>   tests: tpm: Create TPM 1.2 response in TPM emulator
>   tests: acpi: prepare for new TPM 1.2 related tables
>   tests: acpi: Add test cases for TPM 1.2 with TCPA table
>   tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs
>   tests: Use QMP to check whether a TPM device model is available
> 
>  tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 0 -> 8465 bytes
>  .../data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
>  tests/data/acpi/q35/TCPA.tis.tpm12            | Bin 0 -> 50 bytes
>  .../data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
>  tests/qtest/bios-tables-test.c                |  30 ++++++---
>  tests/qtest/tpm-crb-test.c                    |   5 +-
>  tests/qtest/tpm-emu.c                         |  61 ++++++++++++++++--
>  tests/qtest/tpm-emu.h                         |  20 +++++-
>  tests/qtest/tpm-tis-device-test.c             |   3 +-
>  tests/qtest/tpm-tis-test.c                    |   3 +-
>  tests/qtest/tpm-tis-util.c                    |   2 +-
>  11 files changed, 100 insertions(+), 24 deletions(-)
>  create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
>  rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
>  create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
>  rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)
> 
> -- 
> 2.31.1
> 
> 


