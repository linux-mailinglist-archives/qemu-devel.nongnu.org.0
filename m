Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8268D1C3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:51:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJgY-0004jk-98; Tue, 07 Feb 2023 03:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJgU-0004jE-PN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJgS-0004t6-Iq
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675759835;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iKStiP4QM3Pfbw2ytiNKC1JbYBLW9eTpQLgNXI0WAQE=;
 b=ORRtCBTyxjFrFnrrxXJOgs1OHNoRkycHrvJW7y1N2WBZeAboDcFoz2T9CtHCFMcYAg/ylE
 119sw9bmaakKWY4s2O3F7AMPZjyJiP7yM0rUzvxnuqyN9ah4X+z0az9IGDd+jf9HufuEZV
 WmxzK1HDLkXBZpv1WTouqG8QI32wWdM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-EIVjo4IcPbSIIgs8FxAs2A-1; Tue, 07 Feb 2023 03:50:34 -0500
X-MC-Unique: EIVjo4IcPbSIIgs8FxAs2A-1
Received: by mail-wr1-f72.google.com with SMTP id
 by12-20020a056000098c00b002c3ea83975bso685087wrb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKStiP4QM3Pfbw2ytiNKC1JbYBLW9eTpQLgNXI0WAQE=;
 b=QZdcX1gS1c6HB2U30qCGH+SHxjgdcVoQRfN2RSLZO1CLfvJ3MHYifBRdj0HOmW2tYy
 lLCw+3AyFWh0flDRQUBcstoOskl4auxyEXTnUoD/A0LcCn3WMJHvphcMf+x8uX3Il+j1
 UmEe5yeLm+Nw2GFzhoEOb4l4OmX9dK6rIdXIrD45L5OqZ0Y+ocOHHKCEMbKwx0T2NeLd
 uDUwkWlQlgjHhG4J+icjpjsNMH/ujFfGFq8JY0nPskp1PYJAlfRIbQEtck0hFy+uzyxP
 goWCk/jyS3eK4NMCHsrImuef28vrpjFI6iE8r4YbEZjrHocSDrfJoh8F/6lHpbdG6KyB
 wLyQ==
X-Gm-Message-State: AO0yUKXZtSJAKXxwwLI7XeAy+AQ/oxvR+g0mYyGyB40hyjpiRsd3Kv6W
 FnzUiZoFcMerp+RM2mfc+Sq23MxdQaxoIN9tcoLcAWEtqFj1zLHJn/22vUK+F6IHcadZ5lKCyyg
 jjLvhaZuf0OxD94s=
X-Received: by 2002:a05:600c:4910:b0:3dc:1dc3:7a05 with SMTP id
 f16-20020a05600c491000b003dc1dc37a05mr2385994wmp.10.1675759832917; 
 Tue, 07 Feb 2023 00:50:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+BaUMCupIo/UWlB9wFAWFuJnKWKQfrJjvo6CXgs0BIhR5HhUsuTq/4vZqKFRYp1FQ/wXQGow==
X-Received: by 2002:a05:600c:4910:b0:3dc:1dc3:7a05 with SMTP id
 f16-20020a05600c491000b003dc1dc37a05mr2385971wmp.10.1675759832726; 
 Tue, 07 Feb 2023 00:50:32 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c45cf00b003e00c453447sm2886066wmo.48.2023.02.07.00.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:50:31 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 05/12] hw/smbios: Dumb down smbios_entry_add() stub
In-Reply-To: <20230207075115.1525-6-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:08 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-6-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 09:50:30 +0100
Message-ID: <87h6vxc10p.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> The QERR_ macros are leftovers from the days of "rich" error objects.
> We've been trying to reduce their remaining use.
>
> smbios_entry_add() is only ever called on behalf of CLI option
> -smbios.  Since qemu-options.hx sets @arch_mask to QEMU_ARCH_I386 |
> QEMU_ARCH_ARM, it is reachable only for these targets.  Since they
> provide a real smbios_entry_add(), the stub is unreachable.
>
> There's no point in unreachable code keeping QERR_UNSUPPORTED alive.
> Dumb it down to g_assert_not_reached().
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


