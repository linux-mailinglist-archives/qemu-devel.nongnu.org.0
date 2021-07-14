Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6673C7F28
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 09:13:46 +0200 (CEST)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Z5V-0000lD-60
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 03:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3Z4h-0008Vb-Vz
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:12:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3Z4e-0007jL-Ma
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626246770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+fTqVyHlLvS/WPDBFIIzpgIP2K97m1saNNc5Y2XsZk=;
 b=P6JvltZY0yEjWMK29t2EjIQ1YbpKlXEeJ3FS9aGw/gf9atJyBGSjufA6vfQAEIIbEMph7Y
 DJ+1oh5zGnNW7I+5Y4NNZ8R3A75Ram5eh3p0gRxqQOvKGZmrDBBHrYvawVLpwDOoZDPd2T
 RqUfejfNZAcQ3R/li1vMPP+0IRe2xYc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-M7aG_hlNPja5GbPaQUG3lw-1; Wed, 14 Jul 2021 03:12:47 -0400
X-MC-Unique: M7aG_hlNPja5GbPaQUG3lw-1
Received: by mail-wr1-f70.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso1001343wrt.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 00:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P+fTqVyHlLvS/WPDBFIIzpgIP2K97m1saNNc5Y2XsZk=;
 b=aW4Ph6BQDbwnhqAcpw6v6q8ww/jw6RbSp3AtQkFqi44bACTl5LsgFTlx8Byn8UUnF3
 hrklyOpgUn5XdM6Nz2gwnjAqn9P8gumQ/u2seX9YQOfjliI7TkqV26hK67s5CxUBCAGR
 TyYMFm4nPDAsdnoAOzaP02W2QuJNHI+tdTQ2i70khwzSlcuE7NNrloUaSvWfuPtnwehS
 J+Y8AlwuSSFaqCML7K8+yPM8COEdrqCrynKSxGhI/Kgro/SOTmVSqlldmxb0rhlZQDoG
 Xhht+GX8BTis/gxF5aZnXm/mqwyfeRBaWUnaPArzJ+5nDWtTPR56380vtRCbakbOHDvi
 XuBg==
X-Gm-Message-State: AOAM530D+ZH9gqFJ2HiXFdNHj1CfU38fuPuN8c5EXxfixD/RwZWY8Q9d
 KwNJ4g4mlaRceLFbbc59oeu4tqec/vIFIUWBkbBSjM/RIwjOeonz/NYP+JcZKSSqDhI4UMhV+gS
 Mpps3Kjg2mGTzw7k=
X-Received: by 2002:a5d:53c5:: with SMTP id a5mr11127727wrw.15.1626246766644; 
 Wed, 14 Jul 2021 00:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/ktsxKQkahf7/+lxqXI5n60nAhN7Q6yHMOEViaVf1N+hisqhFXYkhVtjNcwXsAaxm3cTFNg==
X-Received: by 2002:a5d:53c5:: with SMTP id a5mr11127701wrw.15.1626246766405; 
 Wed, 14 Jul 2021 00:12:46 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83a2f.dip0.t-ipconnect.de.
 [217.232.58.47])
 by smtp.gmail.com with ESMTPSA id s24sm1568108wra.33.2021.07.14.00.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 00:12:45 -0700 (PDT)
Subject: Re: [PATCH] configure / meson: Move the GBM handling to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210713111516.734834-1-thuth@redhat.com>
 <fbc46ce8-511f-65eb-fa62-aa123bfb0562@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c36de5d8-43fb-4e09-9712-1ab1c2c6734a@redhat.com>
Date: Wed, 14 Jul 2021 09:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fbc46ce8-511f-65eb-fa62-aa123bfb0562@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/2021 14.29, Paolo Bonzini wrote:
> On 13/07/21 13:15, Thomas Huth wrote:
>> The GBM library detection does not need to be in the configure script,
>> since it does not have any user-facing options (there are no
>> --enable-gbm or --disable-gbm switches). Let's move it to meson.build
>> instead, so we don't have to clutter config-host.mak with the related
>> switches.
>>
>> Additionally, only check for GBM if it is really required, i.e. if we
>> either compile with OpenGL or with virglrenderer support.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Queued, thanks.

Drat, sorry, I sent it out too early, one of the CI pipelines finally failed:

  https://gitlab.com/thuth/qemu/-/jobs/1420060624#L100

... thus please drop it again, I have to fix that first.

  Thomas


