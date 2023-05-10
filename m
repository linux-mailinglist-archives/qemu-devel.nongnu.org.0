Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20AC6FDD97
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:20:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwinJ-0000An-1Q; Wed, 10 May 2023 08:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwinG-00008O-VO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwinB-00072a-1k
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VK13S5/iGomdFjcJdmlUDj6sD3Xvz27DtAt8jzP6b9M=;
 b=J5o7UHbfFajca6C3TKhvXKObAo2DlYkf3vNprj6Y0Lyb+rvxXm5nta0gAMqUFmDq1EjVwz
 1QkGurCuSF3Lf6x0SgoPU5EXYg7wE330ZmVueJkmF9o9modo3f9p7P3aaNVnSj3lIUefXg
 xoHwZqyOrUf3Y9bYvdjb0WW3i3wRW78=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-31mQSGo8MJOX-FfmJOqhxQ-1; Wed, 10 May 2023 08:19:34 -0400
X-MC-Unique: 31mQSGo8MJOX-FfmJOqhxQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3079c6648e3so1943835f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683721173; x=1686313173;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VK13S5/iGomdFjcJdmlUDj6sD3Xvz27DtAt8jzP6b9M=;
 b=JC3y53RTooSuEesnzzQghIIXMlDBsKxLZqfpSCRqXHSnzaArd6X6B07BkorW1A/qH7
 xaKoPvgwQt0U3yF4T9ppEN8NSfzgIidcm64SMMTKg72kOuX81nUG2eCSIIBnxml1M6ho
 YTn0T3xCKf2Y9ON9F2wlBuF/IXVTWClZyWBHKXhR1hQNtT3FZ6MBiqjOQdZ9xk+6l+Bp
 +8Crun6TcStuBRzunw1RlVcpCGUSfq6yIJHjGQNayM2F9ha3kWdnOFu7H9cMtFt78VQm
 SzHBCmn977nu5zIK03Ckxw2Hxg9XsJ384FqZagaFzjyOXDONgnThxmM2nPGuXe4w7EuN
 H5ig==
X-Gm-Message-State: AC+VfDwpzxhy2+MmBLBeE1SLt9K8E7+nGgH54a54WWDzEUtooAO2WA7a
 UT9tgah/JmD9YDFFCKwvtwITs1K/BjNrhYprWovKMHsf9WpWQHja7sU+VVonlNRHjVZvVSjHxm1
 sFmxqa8JXXwriER0=
X-Received: by 2002:a5d:534e:0:b0:306:3995:a123 with SMTP id
 t14-20020a5d534e000000b003063995a123mr10772590wrv.27.1683721173127; 
 Wed, 10 May 2023 05:19:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47og8M4t1sKOPTOpXjJ+HCDg8/M8GrVnP67qQcBQzzWFFR0oUiWD4PtsFblg5XkvvEMjfKow==
X-Received: by 2002:a5d:534e:0:b0:306:3995:a123 with SMTP id
 t14-20020a5d534e000000b003063995a123mr10772576wrv.27.1683721172827; 
 Wed, 10 May 2023 05:19:32 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 a4-20020adffac4000000b00304ae802f02sm17293776wrs.66.2023.05.10.05.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 05:19:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 leobras@redhat.com,  Jonathan.Cameron@huawei.com,  dave.jiang@intel.com,
 fan.ni@samsung.com,  "Michael S . Tsirkin" <mst@redhat.com>,  Thomas
 Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: Question about issue #1576: Migration from v8.0.0-rc2 to v7.2.0
 with pcie-root-port device fails
In-Reply-To: <13090490-af78-042d-dd3e-ca9a45d20bdf@proxmox.com> (Fiona Ebner's
 message of "Wed, 10 May 2023 11:31:09 +0200")
References: <13090490-af78-042d-dd3e-ca9a45d20bdf@proxmox.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 14:19:31 +0200
Message-ID: <87mt2c8jl8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fiona Ebner <f.ebner@proxmox.com> wrote:
> Hi,
> I'm trying to fix issue #1576 [0], but having a bit of a hard time.
>
> The issue was introduced by commit 010746ae1d ("hw/pci/aer: Implement
> PCI_ERR_UNCOR_MASK register") and the migration error is:
>> qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
>
> Since there is no dedicated subsection for the new register, but it's
> just part of the existing buffer sent along with the device, the
> approach described in docs/devel/migration.rst, "Connecting subsections
> to properties" doesn't seem to work here.
>
> AFAIU, it would be necessary to unset the new register in the buffer
> before sending for older machine types (before the patch, its value was
> 0). Then older QEMU versions should accept the migration stream again.
> Migration between >8.0 and >= 8.0 when using an older machine type would
> be softly broken, because the register value is reset to 0, but not be a
> hard error, because it's the same situation as forward migration from
> 7.2 (the error condition in get_pci_config_device() doesn't trigger,
> because versions with commit 010746ae1d set the wmask for the new
> register during device initialization).
>
> Is there a good way to unset the register conditionally based on machine
> type during save? Is there any fix for a similar issue in the past I can
> look at?
>
> Or will this be a WONTFIX, because it's just backwards migration and
> QEMU 8.0 has already been released?
>
> [0]: https://gitlab.com/qemu-project/qemu/-/issues/1576

There is a patch on list from Leonardo:

https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00350.html

Or I am missing something?

Later, Juan.


