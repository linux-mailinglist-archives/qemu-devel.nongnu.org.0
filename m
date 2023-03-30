Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DB76D07BA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:09:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsxL-0003Vf-TM; Thu, 30 Mar 2023 10:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1phsxK-0003Sy-Le
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1phsxI-0000QU-NZ
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680185322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ObyQMEBXDJphoBCVoip22CZJ+YKIgBtNL2BlLnylLm0=;
 b=N7gbaOwD+6vi+KJoNlE9THhf6DrMXP6NPdJLKWVDWTCowMO23I/gVcyKM2WpsEL13hFxD7
 S1yb0AVYz9FULzAvlFiQpFG7nHhwpRmVR1z+/iO/gIRMEroghxF9dKyggQnltTHwaRBH2r
 aUSZbgXYgP8haSrYSw5BeS5tr/gShRQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-rQsQO8bkMeeeiSPZR0ltqA-1; Thu, 30 Mar 2023 10:08:37 -0400
X-MC-Unique: rQsQO8bkMeeeiSPZR0ltqA-1
Received: by mail-ed1-f72.google.com with SMTP id
 j21-20020a508a95000000b004fd82403c91so27158338edj.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680185316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ObyQMEBXDJphoBCVoip22CZJ+YKIgBtNL2BlLnylLm0=;
 b=Ixfo804sh4jhwPc+HaJcHVfxeuMUsDXikyNHq6kPB66jqlLC84Hzmlvegf8EAOujBD
 4C2oNsXSraFSlznQIClLmYNHySz/kmaoSnS5HWH2ZP2o/Z2XM+87Cbam7mlWeG26gVVe
 fK41gZt3OcjL7QRu0pnslmcNT6zBU+plRQqmhXEWxO2bxEwXyT7Ay1cV7mLDl4fHYvfY
 0qA8JX/0Juc/59e+koGkh+saSxma+nksT1u4ueTxhhEzMO+0VpzNVl8MavQb6h8F74Ot
 bW3zCTh04FJj+EJKfvJPk4NVtnOuXd/G+Da4lFS2VG12M8j+FTu+twC++37QPP1Se+ID
 5a3A==
X-Gm-Message-State: AAQBX9cANF3XCGlY9E6+0I9M/C6KNkGpOL2ffoNva9z8NsLkqOj5t5VS
 EDAOALgzWfesNHHUoAak9kySrLtiQIxY5BXfPehuC9YB5yhX4PG6plpmU+LqOpZtp9Z8Ssi27Uk
 V13Dy++Dk6MnKq0o=
X-Received: by 2002:a05:6402:6cf:b0:4fd:5a28:2eff with SMTP id
 n15-20020a05640206cf00b004fd5a282effmr20803019edy.26.1680185316443; 
 Thu, 30 Mar 2023 07:08:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350bQGvfoRz9EyDXs4vKGKaREwtWK9zypwrH2JTPkn0eppBv1AtFUS0DbWuzyHYMXgUEuxVDnAA==
X-Received: by 2002:a05:6402:6cf:b0:4fd:5a28:2eff with SMTP id
 n15-20020a05640206cf00b004fd5a282effmr20803005edy.26.1680185316217; 
 Thu, 30 Mar 2023 07:08:36 -0700 (PDT)
Received: from [10.43.17.81] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 y70-20020a50bb4c000000b004fa380a14e7sm18360793ede.77.2023.03.30.07.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:08:35 -0700 (PDT)
Message-ID: <27c3c14c-6d91-a01f-94c7-c874f096665d@redhat.com>
Date: Thu, 30 Mar 2023 16:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ui/gtk: use widget size for cursor motion event
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20230320160856.364319-1-ernunes@redhat.com>
 <IA0PR11MB71850EDD187027261A5D260BF8819@IA0PR11MB7185.namprd11.prod.outlook.com>
 <a38996cb-1ca9-6bfd-3fb8-2ba037243472@redhat.com>
 <IA0PR11MB7185E1E1B14D97797D672C2EF8879@IA0PR11MB7185.namprd11.prod.outlook.com>
 <CAJ+F1CK28C4EL=abcJWo3TOZqsMxdTnrbE0Y40Jabn-vFXaBbg@mail.gmail.com>
From: Erico Nunes <ernunes@redhat.com>
In-Reply-To: <CAJ+F1CK28C4EL=abcJWo3TOZqsMxdTnrbE0Y40Jabn-vFXaBbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ernunes@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 23/03/2023 15:41, Marc-André Lureau wrote:
> Should we queue the 2 patches from this series? (note that they were
> not correctly handled by patchew, probably because you dropped the
> cover letter).
> 
> For me -display gtk is unusable on hidpi & wayland anyway, because the
> cursor position given to the guest does not match the dimensions given
> for the monitor.
> 
> Also relative mouse support is broken as well (mouse wrapping and
> confinement/grab is not supported by gdk/gtk on wayland).
> 
> I am not actively looking at these problems, they are "solved" with
> spice (use -display spice-app). And I am also regularly working on a
> gtk4/rust widget, using -display dbus
> (https://gitlab.gnome.org/malureau/rdw). There is also
> https://gitlab.gnome.org/chergert/libmks as a gtk4/C alternative. I am
> not sure we should keep maintaining the gtk3 backend going forward.
> And as a Gtk4/-display dbus client mature, I hope we can offer a
> better alternative than ui/sdl or ui/cocoa on other platforms as well.

To answer this: well since we already have the fixes, if it gets reviews
I think we could merge them anyway.

But realizing that the built-in gtk UI is in this best-effort state, I
probably won't be spending much time on it anymore either.
It seems to be more productive to focus the effort on improving the
experience with the dbus backend and its UIs going forward, then.

Thanks

Erico


