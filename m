Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3463AD8B0
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 10:47:17 +0200 (CEST)
Received: from localhost ([::1]:58536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luWdH-0002EF-KF
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 04:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1luWbc-0001RW-6q
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 04:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1luWbV-0006QH-OJ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 04:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624092323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EGAvHa2Fc+LuyHK72Etz0phzx5J4jx6eyLE2vJ8rFk=;
 b=GfkBVGf9vtRSKhVyx1GUpKA7LymKEs9lVYRSWMykLgDXmHrWzO5Ov/Tar0VcLx5n0cl38W
 5W6JRq1EtN2n4udz0M+YwpNk3us8cmxlLUenbe1n7/6YM15JPTc085Ua4H28tvL/WnkzVU
 QFF5WKMZIwY3u5qDltT6xYeZM63yRa4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-18rHEj2LOeaK8__t5RzsTA-1; Sat, 19 Jun 2021 04:45:21 -0400
X-MC-Unique: 18rHEj2LOeaK8__t5RzsTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v20-20020a05600c2154b029019a6368bfe4so4438158wml.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 01:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6EGAvHa2Fc+LuyHK72Etz0phzx5J4jx6eyLE2vJ8rFk=;
 b=QkehUyACkilKST6/Rk7ojBgvFCAkkDFkxAID/vp1ywJu97xZIN/cH91nFhTvRzILRi
 Sdez/bEIwLtl00nu73UxYOsl7sa+5yQ3WaYEiZ6DqhRGhAIZTfSg4vZGq4Bq1dpdO2MH
 ZtqEt67Qt++PUsGzF4wYZ7bRV7qdpP6DBkAy9CCs6adpJj4jwc4zyLc4zL8a6QpTCsGR
 wIOi3jDBn5EEGxPbkZgi3R5lYGJav+H7DqTS2MPAGYhfb7ZvBuTo30E72wA80qe1vN+F
 urpITK1nozdZnOgCPpJYQjbmP32YnbQL2wAq9YWppNLZKXUVlJC1qV9igv8MQTV2MIeA
 dH4Q==
X-Gm-Message-State: AOAM531C0nEWzCghsbxpISUyVHlMtXzFjcSWyC8L7pluEOAEwAwF0Yy0
 nyDVS976AAeFXcpvy6YTHOiTeXXeWt63i92keHK+evnK6Gbjzq+bWWxo5aORH5OIG5AXVouAxY3
 jdXhVc4SMbOunfjg=
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr14978464wmp.107.1624092320714; 
 Sat, 19 Jun 2021 01:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAdnwTTjlrF4oMFsxf4MmQtViZEPKW8uaqEmGidlHPtYVbcJhFZndlHsbDf1fAFdJl3rdtWA==
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr14978442wmp.107.1624092320501; 
 Sat, 19 Jun 2021 01:45:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n10sm11272276wre.95.2021.06.19.01.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 01:45:19 -0700 (PDT)
Subject: Re: [PATCH v2 19/23] hw/i386: Move pc_madt_cpu_entry() to acpi-pc.c
To: Igor Mammedov <imammedo@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-20-philmd@redhat.com>
 <20210618133720.459491bd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a9e25c7f-2cff-229f-49ab-3f18b9cb1e1f@redhat.com>
Date: Sat, 19 Jun 2021 10:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618133720.459491bd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 1:37 PM, Igor Mammedov wrote:
> On Wed, 16 Jun 2021 22:43:24 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> pc_madt_cpu_entry() is specific to QEMU 'PC' machines,
>> move it to acpi-pc.c.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/i386/acpi-common.c | 40 ----------------------------------------
>>  hw/i386/acpi-pc.c     | 39 +++++++++++++++++++++++++++++++++++++++
> 
> it's used not only by PC machines but also microvm,
> which didn't use acpi-build.c (aka acpi-pc.c)
> it only links fine by virtue that PC machines
> are object files are also included.

Is that something new? I can't see this in mainstream,
the microvm machine builds fine without this code.


