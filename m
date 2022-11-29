Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE4563C8E1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 21:00:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p06lE-0002iL-78; Tue, 29 Nov 2022 14:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p06lC-0002iC-Jf
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 14:59:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p06lA-0000Uy-7y
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 14:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669751955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+d3kiv7CFa4ip3r9bAhBWQKuxLrvQfCzz/PwwldgKaU=;
 b=F5dq92cs98Vafyx4P14MFnLkGnLGvtbPqoZuijGrV40xalHYv93aRgQ3aMe/2vb0tqX6jQ
 iF0K2qu+MXJd86KqX5dUzq9evGeVDWMeuQ193S5+gEC4DE1Y/x0bY9qOWSB+QFVQunr/K/
 54nmzHJnegNxWjMRXVOTuBI2JE35VnI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-SgRPl1J3MKqEgOFyqdyP9A-1; Tue, 29 Nov 2022 14:59:13 -0500
X-MC-Unique: SgRPl1J3MKqEgOFyqdyP9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso8309980wme.3
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 11:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+d3kiv7CFa4ip3r9bAhBWQKuxLrvQfCzz/PwwldgKaU=;
 b=2e7EIANXgTo9BwIWrLP6WykWhu/FO2qeTEOSn9ikRaFNcMN842/26z7vKaK0q2A8Ml
 HuwHTICRtYKS/qhgkNVvURy6eAe32pS7e0BJCjoJ+b++F4/5qjIZGAQtdSGVzmqDybqN
 V+n+5Qpg/mg8VM9q5+cgGtanjhdftZatPWtZd1VbyfPshBp3BdfIKM/0gFeDgR+ApBGi
 QCyN+eLJAnWJV6zGVQIB4/Otl2vCcUkpdHdJOb+qfroMN2GG/e84ha1hZGtt7Pn6U6J5
 gEL0wdJ8U9L1KT5w1lggN+BGwGknTMrCZ2R0EpLPeSgr+Du/ims33jHkHkyvo/SZiCV8
 eagg==
X-Gm-Message-State: ANoB5pmWYtEiazDr5rrerB7QG+B+kLHt4aC8udavHfNhGLSq9yjqxdr8
 /szCo3AGMuq9c4p/FRrVZdBZ6fnYIwN1EixA/vmoZUTHPYKWWxc0yKC1rJBgjOtf/9zwvo3jfrZ
 fd+NJYb3Ua9u2waE=
X-Received: by 2002:a05:6000:2c9:b0:242:1b0e:5647 with SMTP id
 o9-20020a05600002c900b002421b0e5647mr6080034wry.683.1669751952848; 
 Tue, 29 Nov 2022 11:59:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4TyYMx8lyf24rj2NVpKANMRZoSQrR//eun6ADfvBeDKOAAnpCHYl+R8hf6TlWzJloiOzqLdA==
X-Received: by 2002:a05:6000:2c9:b0:242:1b0e:5647 with SMTP id
 o9-20020a05600002c900b002421b0e5647mr6080026wry.683.1669751952643; 
 Tue, 29 Nov 2022 11:59:12 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 s30-20020adfa29e000000b00242246c2f7csm2292904wra.101.2022.11.29.11.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 11:59:12 -0800 (PST)
Date: Tue, 29 Nov 2022 19:59:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 10/12] pci: Inline do_pcie_aer_inject_error() into its
 only caller
Message-ID: <Y4Zkjj83YnmZeLh3@work-vm>
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-11-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128080202.2570543-11-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Markus Armbruster (armbru@redhat.com) wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Yeh that seems to have simplified out;

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/pci/pci-hmp-cmds.c | 41 ++++++-----------------------------------
>  1 file changed, 6 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
> index 393ab4214a..b03badb1e6 100644
> --- a/hw/pci/pci-hmp-cmds.c
> +++ b/hw/pci/pci-hmp-cmds.c
> @@ -159,21 +159,7 @@ void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
>      }
>  }
>  
> -typedef struct PCIEErrorDetails {
> -    const char *id;
> -    const char *root_bus;
> -    int bus;
> -    int devfn;
> -} PCIEErrorDetails;
> -
> -/*
> - * Inject an error described by @qdict.
> - * On success, set @details to show where error was sent.
> - * Return negative errno if injection failed and a message was emitted.
> - */
> -static int do_pcie_aer_inject_error(Monitor *mon,
> -                                    const QDict *qdict,
> -                                    PCIEErrorDetails *details)
> +void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
>  {
>      const char *id = qdict_get_str(qdict, "id");
>      const char *error_name;
> @@ -189,12 +175,12 @@ static int do_pcie_aer_inject_error(Monitor *mon,
>          monitor_printf(mon,
>                         "id or pci device path is invalid or device not "
>                         "found. %s\n", id);
> -        return ret;
> +        return;
>      }
>      if (!pci_is_express(dev)) {
>          monitor_printf(mon, "the device doesn't support pci express. %s\n",
>                         id);
> -        return -ENOSYS;
> +        return;
>      }
>  
>      error_name = qdict_get_str(qdict, "error_status");
> @@ -203,7 +189,7 @@ static int do_pcie_aer_inject_error(Monitor *mon,
>              || num > UINT32_MAX) {
>              monitor_printf(mon, "invalid error status value. \"%s\"",
>                             error_name);
> -            return -EINVAL;
> +            return;
>          }
>          error_status = num;
>          correctable = qdict_get_try_bool(qdict, "correctable", false);
> @@ -239,25 +225,10 @@ static int do_pcie_aer_inject_error(Monitor *mon,
>      if (ret < 0) {
>          monitor_printf(mon, "failed to inject error: %s\n",
>                         strerror(-ret));
> -        return ret;
> -    }
> -    details->id = id;
> -    details->root_bus = pci_root_bus_path(dev);
> -    details->bus = pci_dev_bus_num(dev);
> -    details->devfn = dev->devfn;
> -
> -    return 0;
> -}
> -
> -void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
> -{
> -    PCIEErrorDetails data;
> -
> -    if (do_pcie_aer_inject_error(mon, qdict, &data) < 0) {
>          return;
>      }
>  
>      monitor_printf(mon, "OK id: %s root bus: %s, bus: %x devfn: %x.%x\n",
> -                   data.id, data.root_bus, data.bus,
> -                   PCI_SLOT(data.devfn), PCI_FUNC(data.devfn));
> +                   id, pci_root_bus_path(dev), pci_dev_bus_num(dev),
> +                   PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
>  }
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


