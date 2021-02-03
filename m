Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D6F30E011
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:53:05 +0100 (CET)
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LOq-0000DI-Lo
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7LLB-0006PC-54
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7LL3-0006zt-Qn
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612370947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqGcYxFxEUpQG9cpBNRqNzLNlyRjyCgl8J6haE53ejI=;
 b=euMfMWxZa8wIw1t63wqzgW7HfQPraxp8nM00tlyy37bTvVd+/LN2V/6u4ltdDhAWnpvhtL
 pLjCXQ4GFfzsMQryW15w4zkvb4FgdNCtiMF2WLzNLqVUf7HI//cyC1mrbS+lmRacmqNXWa
 siUNRDHy6XVCkRCdsi3ZhW4NqvlWi7U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-VqcoUq9HMRmBy_GHzH3HNA-1; Wed, 03 Feb 2021 11:49:03 -0500
X-MC-Unique: VqcoUq9HMRmBy_GHzH3HNA-1
Received: by mail-ej1-f71.google.com with SMTP id bx12so57087ejc.15
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KqGcYxFxEUpQG9cpBNRqNzLNlyRjyCgl8J6haE53ejI=;
 b=Argt06L2Gn+UK1LBwhHIgkfvDXUpwX2MEJG6KhUt9z3ndqDrgyczKrzpydtlv0CaqV
 XhIXE1KC/gB+Vzi7OzMnXWR7UP9R6BuzGeyV6uDDxz6LmcGHQ9Z16poFewUcj8yptAMJ
 SDqGgM9M8Rg9QtNz1q4+cAFdkLZ6RGBc/RH+tEeE66gPB49Z/7Rs5Qh6GbmdOU6GQkct
 CxzteGmVSCtbpANM9ElzDMVvstBqCelMJZzFBm2tDrzy8TcdJSiyQvJzfWjw3au07ERz
 ZoLKNvKQO2H2HWd/oMeTC5Hh4D8pJGXvj1RN4oNkr6/KuUfepJWHzn5gsShzeccLfqjA
 pA4A==
X-Gm-Message-State: AOAM532KcAX5ze5XQf2G8M/mobkmZwucTCubcwxPARrEPQmHD8rcPMld
 Uw64lLb2nzrMijPzx298kxxj6Z9O5QsP8b4UPX01TvAMUaf9VS0cVlF4acj9sQ7xckroFHHVBUW
 +d91GoxvpwzCOZBI=
X-Received: by 2002:a17:906:1a11:: with SMTP id
 i17mr4175004ejf.278.1612370936601; 
 Wed, 03 Feb 2021 08:48:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFJmGxYGQ4TV8xgwb/0DNKce0ECz1UjWmWpufJBdKQ+MkVROvn5SuxY70p83PLJaSyezA1JQ==
X-Received: by 2002:a17:906:1a11:: with SMTP id
 i17mr4174829ejf.278.1612370934103; 
 Wed, 03 Feb 2021 08:48:54 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id w8sm1124153edd.39.2021.02.03.08.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:48:53 -0800 (PST)
Subject: Re: cdrom scsi passthough not working well
To: daggs <daggs@gmx.com>, qemu-discuss@nongnu.org
References: <trinity-9b27278b-c96f-472f-a115-9bf29b44c103-1603862318112@3c-app-mailcom-bs15>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <46ec2226-2e5b-4e73-9b01-4e55f1f1fcbc@redhat.com>
Date: Wed, 3 Feb 2021 17:48:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <trinity-9b27278b-c96f-472f-a115-9bf29b44c103-1603862318112@3c-app-mailcom-bs15>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-block@ developers.

On 10/28/20 6:18 AM, daggs wrote:
> Greetings,
> 
> I have a vm running under qemu 5.1.0 with a cdrom scsi passthough into it.
> I can eject the device in and out but when I insert a disc, is isn't detected and the dmesg on the guest is filled with these prints:
> [384216.443262] sr 0:0:0:0: ioctl_internal_command return code = 8000002
> [384216.443268] sr 0:0:0:0: Sense Key : 0xb [current]
> [384216.443272] sr 0:0:0:0: ASC=0x0 ASCQ=0x6
> [384218.504142] sr 0:0:0:0: ioctl_internal_command return code = 8000002
> [384218.504150] sr 0:0:0:0: Sense Key : 0xb [current]
> [384218.504153] sr 0:0:0:0: ASC=0x0 ASCQ=0x6
> [384220.561302] sr 0:0:0:0: ioctl_internal_command return code = 8000002
> [384220.561308] sr 0:0:0:0: Sense Key : 0xb [current]
> [384220.561312] sr 0:0:0:0: ASC=0x0 ASCQ=0x6
> 
> the vm is uefi q35 based, generated by libvirt 6.8.0, the cdrom part is this:
> -blockdev {"driver":"host_device","filename":"/dev/sg0","node-name":"libvirt-2-backend","read-only":true}
> -device scsi-generic,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=libvirt-2-backend,id=hostdev0
> 
> id there something bad with the config or have I encountered a bug?
> 
> Thanks,
> 
> Dagg.
> 


