Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE92B4ED1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:05:49 +0100 (CET)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keisu-0007CC-FA
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keipO-0004Jk-01
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keipK-00054V-US
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605549725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nqWL+fiC6eqjBW5BBpJksJvlJ97FN4rdV04/8ow8snM=;
 b=B+c0fzs2qBSG/BX9gaRQXERh+rDQMKP+MW70sQozIFLH/3SwgoW1xYmffXsPgzHY8vpgmR
 DxmV6X7W7cKhAqNlmo7Gj6keJz42OlAz9uoiZLRZcQLyCyfZVRqzMlAIuQIjsc9DDabqJZ
 mGfg7pn9O2OWS/8bScfqavBdsoPzhPA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-29Scp-u-PReJr2-QHuiE9A-1; Mon, 16 Nov 2020 13:02:01 -0500
X-MC-Unique: 29Scp-u-PReJr2-QHuiE9A-1
Received: by mail-wr1-f72.google.com with SMTP id h13so6026367wrr.7
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nqWL+fiC6eqjBW5BBpJksJvlJ97FN4rdV04/8ow8snM=;
 b=RuLq1tanW/jgZSr+eTJWxNiC1CnDfiiC2WHYlPwBQ6X6DSk39qEO8wQ0EOgrbb6oyf
 ZEiqhZD2um92FvR34wiAYBMaOBYc66+jTuhaH0XwWs2tv51oQSqBP5fXbcGo7F8U5aa3
 ae+Doo+dRIrwVLd2HDSMCigpcOMuaBLBE1qHfGg0ZaifKlvcJFsp9S3CXQicd+xT8/PL
 SgejSp4Gd6Q0dD8vTI/kQ5+bBGNL/4zCtcGW2zyfXW28DmfmtIKRIgmT69MHPZ7OxVg6
 h+0OKN7VmxOoWzUKW0UrT5EhbjJWZdcmaa4TR0cTdikxC0dZz0NoYKDSkimzb8wpVfJY
 KxJw==
X-Gm-Message-State: AOAM533EmtsGwm2Mzhv34lv5Q0Hd7ryhneUKembzDZOKqRXrAVuipkCK
 QYqANpzfF80YduDkRicGTtogSYAXS+jqxNXcxXf3I/jo9CeMUc/w47rVTVbeRbW1PoCH+05vZgS
 GdCwhpHRsfr+TUJU8O2KrzjxiYxiyGcdzBxeoqcWbUJ8phVUBZ3OuFZsv3ai+FsUc
X-Received: by 2002:a7b:c848:: with SMTP id c8mr112729wml.86.1605549720205;
 Mon, 16 Nov 2020 10:02:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfPw0K4Q649VF2qE7pDPUCjacWqIjTPF2lUTrpMqw4ANOjne2j9eR/he3cpuhLXDRcbuukLw==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr112695wml.86.1605549719984;
 Mon, 16 Nov 2020 10:01:59 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u14sm20910566wrq.93.2020.11.16.10.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 10:01:59 -0800 (PST)
Subject: Re: [PULL 05/17] hw/i386/acpi-build: Fix maybe-uninitialized error
 when ACPI hotplug off
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201115220740.488850-1-mst@redhat.com>
 <20201115220740.488850-6-mst@redhat.com>
 <CAARzgwzVqPC5jwx9DERjW8cy+OsZ5cgkQceX=DOzZT5-0U09Yw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7074a192-ecfe-c0ab-065f-5494bca52dd9@redhat.com>
Date: Mon, 16 Nov 2020 19:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAARzgwzVqPC5jwx9DERjW8cy+OsZ5cgkQceX=DOzZT5-0U09Yw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 6:44 PM, Ani Sinha wrote:
> 
> 
> On Mon, Nov 16, 2020 at 03:57 Michael S. Tsirkin <mst@redhat.com
> <mailto:mst@redhat.com>> wrote:
> 
>     From: Philippe Mathieu-Daudé <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
> 
>     GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
>     is already in the "if (bsel || pcihp_bridge_en)" block statement,
>     but it isn't smart enough to figure it out.
> 
>     Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
>     block statement to fix (on Ubuntu):
> 
>       ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
>       ../hw/i386/acpi-build.c:496:9: error: 'method' may be used
>     uninitialized
>       in this function [-Werror=maybe-uninitialized]
>         496 |         aml_append(parent_scope, method);
>             |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       cc1: all warnings being treated as errors
> 
>     Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug
>     is off globally")
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
>     Message-Id: <20201107194045.438027-1-philmd@redhat.com
>     <mailto:20201107194045.438027-1-philmd@redhat.com>>
>     Acked-by: Ani Sinha <ani@anisinha.ca <mailto:ani@anisinha.ca>>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com <mailto:mst@redhat.com>>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com
>     <mailto:mst@redhat.com>>
> 
> 
> Is there any reason why my ack was removed from the patch that was
> ultimately merged?

The patch merged is not the patch Michael queued. So your Ack has not
been removed, simply Alex queued an older version previous to your Ack.
https://www.mail-archive.com/qemu-devel@nongnu.org/msg760119.html

> 
> https://git.qemu.org/?p=qemu.git;a=commit;h=811c74fb657db0559274a710e50ef0096a1915a3
> <https://git.qemu.org/?p=qemu.git;a=commit;h=811c74fb657db0559274a710e50ef0096a1915a3>


