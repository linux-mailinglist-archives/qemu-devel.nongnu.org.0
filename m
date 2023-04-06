Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E210D6D8F52
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 08:23:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkJ0C-0001jH-Mg; Thu, 06 Apr 2023 02:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pkJ08-0001j2-Kp
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:21:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pkJ06-00035u-5x
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680762096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aOlU/PvIUp3IktFvOFRK/DTr9vbqGL5wpm2rOJIDfIk=;
 b=fnA8SVdRojY31dgpq0cJPcTYEM78Ka8q1Z2WWWeXyW0KJs7YWPDS11H6HrfXMi8J4J9QuD
 NsgI2uzRMsGtkEY6tamRFkosxM76mBGj7lKPCkF7dvfs9ovuRDuUWmRsju5WNP/4YdgNgi
 Ct9if9nH5Lnpdf3sDs8I0sMWIERcoNw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-NuUWPzWpNc-kCRA0hpWnFw-1; Thu, 06 Apr 2023 02:21:32 -0400
X-MC-Unique: NuUWPzWpNc-kCRA0hpWnFw-1
Received: by mail-pf1-f197.google.com with SMTP id
 m12-20020a62f20c000000b0062612a76a08so17009946pfh.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 23:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680762091;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aOlU/PvIUp3IktFvOFRK/DTr9vbqGL5wpm2rOJIDfIk=;
 b=CdTIl6WBU+YxK/CIjZrRH2Y4aGE/SQgpbJAR7gZOusvEqrdPARYm/3ZJktYgNCWUyX
 kbM9ujZkW5xBys502IwFIgCcXbbNO7dke5lciCT5Zmjx1X0MNBd7rdoFuMwRGUxBqJkG
 kmr4i68KeME8otZIX2hAuFmvmbvpTUjB9QkZbHLnfEzubHF5vcv1z+4gMLMtNmO6scV8
 mjCGZRy5yj5w4H1axLfikaOpizpE6c0GHQ3qVu/OlznO9mAPM4kxB/KszdK+38Rft4Vx
 Wz74MM+myZV5mwaJuZOjiey2nxPJ96shuTnMlIsFTCha3cgsRDvIDKozzgf2lkX/cxK5
 UjGA==
X-Gm-Message-State: AAQBX9f7q63x/D/i8fP3lMlNh672KAe0YD//DH6gPwT6NH3gU9/VOrY2
 p9DKSqfFckk6avkm4lW+S/m4iuMRHFXBN2bCpW9fn2uXw+qfWG3Bq7tw5qIZq4aKqee+Q8MwbA0
 AdtNbvWKnngSme6M=
X-Received: by 2002:a62:1cc6:0:b0:62e:11:2e57 with SMTP id
 c189-20020a621cc6000000b0062e00112e57mr7798181pfc.22.1680762091372; 
 Wed, 05 Apr 2023 23:21:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350YW3kQ9Y2PMfK4lN7tk2XGqz65bLYrzD5xDLhNxUCRg26F5tqGHQFqBsaJXzukbSz/QTKBktA==
X-Received: by 2002:a62:1cc6:0:b0:62e:11:2e57 with SMTP id
 c189-20020a621cc6000000b0062e00112e57mr7798161pfc.22.1680762091038; 
 Wed, 05 Apr 2023 23:21:31 -0700 (PDT)
Received: from fc37-ani ([115.96.127.238])
 by smtp.googlemail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm424157pfr.213.2023.04.05.23.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 23:21:30 -0700 (PDT)
Date: Thu, 6 Apr 2023 11:51:25 +0530 (IST)
From: Ani Sinha <anisinha@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
cc: qemu-devel@nongnu.org, mst@redhat.com, jusual@redhat.com, 
 kraxel@redhat.com
Subject: Re: [PATCH v2] acpi: pcihp: make pending delete blocking action expire
In-Reply-To: <20230405083444.1536720-1-imammedo@redhat.com>
Message-ID: <8d03fb3d-8541-c6f5-0fac-ca61e8d7325c@redhat.com>
References: <20230405083444.1536720-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
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



On Wed, 5 Apr 2023, Igor Mammedov wrote:

> with Q35 using ACPI PCI hotplug by default, user's request to unplug
> device is ignored when it's issued before guest OS has been booted.
> And any additional attempt to request device hot-unplug afterwards
> results in following error:
>
>   "Device XYZ is already in the process of unplug"
>
> arguably it can be considered as a regression introduced by [2],
> before which it was possible to issue unplug request multiple
> times.
>
> Allowing pending delete blocking expire brings ACPI PCI hotplug
> on par with native PCIe unplug behavior [1] and allows user
> to repeat unplug requests at propper times.
> Set expire timeout to arbitrary 1msec so user won't be able to
> flood guest with SCI interrupts by calling device_del in tight loop.
>
> PS:
> ACPI spec doesn't mandate what OSPM can do with GPEx.status
> bits set before it's booted => it's impl. depended.
> Status bits may be retained (I tested with one Windows version)
> or cleared (Linux since 2.6 kernel times) during guest's ACPI
> subsystem initialization.
> Clearing status bits (though not wrong per se) hides the unplug
> event from guest, and it's upto user to repeat device_del later
> when guest is able to handle unplug requests.
>
> 1) 18416c62e3 ("pcie: expire pending delete")
> 2)
> Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> v2:
>    * change timeout to 1ms
>    * add comment to expire usage
>    * massage commit message to be a bit more clear
>
> CC: mst@redhat.com
> CC: anisinha@redhat.com
> CC: jusual@redhat.com
> CC: kraxel@redhat.com
> ---
>  hw/acpi/pcihp.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index dcfb779a7a..5daa732a33 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -357,6 +357,16 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>       * acpi_pcihp_eject_slot() when the operation is completed.
>       */
>      pdev->qdev.pending_deleted_event = true;
> +    /* if unplug was requested before OSPM is initialized,
> +     * linux kernel will clear GPE0.sts[] bits during boot, which effectively
> +     * hides unplug event. BAnd than followup qmp_device_del() calls remain
> +     * blocked by above flag permanently.
> +     * Unblock qmp_device_del() by setting expire limit, so user can
> +     * repeat unplug request later when OSPM has been booted.
> +     */
> +    pdev->qdev.pending_deleted_expires_ms =
> +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL); /* 1 msec */
> +
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> --
> 2.39.1
>
>


