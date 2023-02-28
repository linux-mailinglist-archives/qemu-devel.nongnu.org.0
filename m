Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C16A61C0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:51:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7rv-0006Sq-Ue; Tue, 28 Feb 2023 16:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7ru-0006Sa-Gy
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:50:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7rt-0003A2-5b
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677621040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdzkNeUdS61PBqy95gh5JkT7syPC9xHJ6D+kulAnETw=;
 b=JrwLfBuM76rd+LHLRXQcmkOCTYGdd8/ukxyfq8hWWp5iS/VJSIkICdUYWfBxxr++vc38WF
 0v4c+kB+D6MDxvCCrKdYS2m0Ngst+c39ZOKsiMu3/gFwXvzJIVnPsBUnsgPgZMEwtvFhJi
 4TwNJuk1aDEdD53to3SpDzdZQjOZiJQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-jnA8HjT9O_GVBKXpC4Z0Tw-1; Tue, 28 Feb 2023 16:50:39 -0500
X-MC-Unique: jnA8HjT9O_GVBKXpC4Z0Tw-1
Received: by mail-wm1-f70.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso4760075wmh.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677621038;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UdzkNeUdS61PBqy95gh5JkT7syPC9xHJ6D+kulAnETw=;
 b=vW9wLVBjivUUwd6cgQcqc0K44JsgfUGWZ5BStINQqfXRrv+vyKqZ8L3zf+bFfWGGrN
 sl6iqv/LSHkX9OYr69tE6Yk/v7NJEPK14/OFSbxfzwaP0poRPDHP94IwJhkVk/mt+h50
 fUuohEZyVjVOXZafNurUDnCMl1ydIOsA8dOHkv66ONffsqx9bz9unKCtJK56dBJQawgQ
 RhRXX1454SAQJ5a59BS+QQSQzrZBDnR/ACAoG4RhpzhFr+rx5degpiieSkBbXO0K6lPz
 8pfkUcJ/4Pqyswykle0JLmRqEVLtwI+4V3Iy6MYsfwC7vdNPvhiT5fZPwxpwKH0GzbrX
 Zbxw==
X-Gm-Message-State: AO0yUKWQQp4ycmMHxwvfLxrWf01O8Z/qBZTeWb0uzmEDvX1uoVdNG+s/
 LYQj1AnVN3pCCE2DxR27suZBs/XZiGYDjl0AeT29XSqGW42dp6VzLqgA0pww5kxsR0vdU5mx6A7
 MituV7szET/GROU8=
X-Received: by 2002:a05:6000:11c7:b0:2c3:eeeb:b2f7 with SMTP id
 i7-20020a05600011c700b002c3eeebb2f7mr3116991wrx.62.1677621038076; 
 Tue, 28 Feb 2023 13:50:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9IL1jWH53UjzonwXoPPHUyDjc8W2skkd+n/7d4K/f50FVRlWLdDlJ63RwT+ttPV7fryA8L/w==
X-Received: by 2002:a05:6000:11c7:b0:2c3:eeeb:b2f7 with SMTP id
 i7-20020a05600011c700b002c3eeebb2f7mr3116981wrx.62.1677621037720; 
 Tue, 28 Feb 2023 13:50:37 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 d2-20020adfef82000000b002c5801aa9b0sm11009178wro.40.2023.02.28.13.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:50:37 -0800 (PST)
Date: Tue, 28 Feb 2023 16:50:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 0/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Message-ID: <20230228164923-mutt-send-email-mst@kernel.org>
References: <20230203163021.35754-1-philmd@linaro.org>
 <00dd2e23-7b5c-272f-b8ea-f0d1677d18da@linaro.org>
 <e6f93935-70a1-a791-4026-c344e0fa95ca@linaro.org>
 <20230228164731.38d77311@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228164731.38d77311@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 28, 2023 at 04:47:31PM +0100, Igor Mammedov wrote:
> On Tue, 28 Feb 2023 14:36:43 +0100
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
> > ping^2
> 
> please use checkpatch before pasting series.
> 
> Object -> DeviceState is a nice cleanup,


I don't like that one either because everyone wants Object so
we just cast it back all the time. Let's carry what we use
if all you call sites cast you know you should keep the type you
cast to.


> the rest is just unnecessary churn in my opinion and a matter of taste,
> but I fine with it if it makes code easier to read
> for someone else.
> 
> 
> > 
> > On 22/2/23 22:34, Philippe Mathieu-Daudé wrote:
> > > On 3/2/23 17:30, Philippe Mathieu-Daudé wrote:  
> > >> To ease code review, rename ACPI CPU hotplug variables
> > >> to more meaningful names.
> > >>
> > >> Since hotplug parent can't be any QOM object, and must be
> > >> a QDev, convert AcpiCpuHotplug::device from Object* to
> > >> DeviceState*.
> > >>
> > >> Philippe Mathieu-Daudé (3):
> > >>    hw/acpi/cpu_hotplug: Rename gpe_cpu -> gpe
> > >>    hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as 'container'
> > >>    hw/acpi/cpu_hotplug: Convert 'Object *device' -> 'DeviceState *parent'  
> > > 
> > > ping  
> > 


