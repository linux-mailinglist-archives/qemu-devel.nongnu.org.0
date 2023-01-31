Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06CF682FE9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:57:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqqc-000307-2r; Tue, 31 Jan 2023 08:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMqqT-0002zz-24
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMqqD-0005FL-OA
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675172290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pHzi2ikX4eA/lkQIQOwNzJXy6L0fFPe0iV7D6VvW0M=;
 b=LBs2bahUZyX2/PBUwSbrvFF20LWsm1Gv/6mdz9YyH08/3xD2v2xJPhrZF7RWCMOzAlPEHv
 P4VP9Lf/iT5B2lRgg8I/l7pOhQRVpOpumOLb1BTqa2dO+I5WomOsdxmY6GVi0IPMCbOiSv
 DIjtTiKaQc1L1H2drP47tynlKXkSQKU=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-mmW7p-RmNbKGE-cj-bNevg-1; Tue, 31 Jan 2023 08:38:09 -0500
X-MC-Unique: mmW7p-RmNbKGE-cj-bNevg-1
Received: by mail-ua1-f69.google.com with SMTP id
 o6-20020ab01506000000b004f8c11096a9so5732629uae.20
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 05:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3pHzi2ikX4eA/lkQIQOwNzJXy6L0fFPe0iV7D6VvW0M=;
 b=UvoE/U28kmFO2etEpBOhmGH0Zl6qbVLp+CZefVojSkoeE3Gls4ug8mgezGl2uIInks
 CSwOA9kpWjqGkecpFx99FWA8p2rAvzNEBf93lxc4UmOhfuDKq7S9MjD8kNgDOnXIjn3M
 i1qXdJJs850iTtzqUR9P7TaZ8p8D3lgZ2hMGZ1vwPv4cLFFTkkm4KIFj47OfzPMZDwhy
 gGtds+T2QlGgrbbJvYLFgSTzdm3MIx97LqFy+ctj0E8opMbbtkbKa4O3gRKt4VDI2DIV
 J7F7Rx6vDeYFe1wIndpYLLduNYJDYiBbNk+ZTtFzG9YpnPdf8+0PA0/XLwIVuKnBp4Mm
 YCAQ==
X-Gm-Message-State: AO0yUKWK12kQkijoA4nAor2agSkKnfVsnplHbowNYxTLMhNg/FlxTZX9
 5twgMGKQSZ6P2ksT9whioPWjdmUhfFhmiaQ53qzL5jAEzZhmSGYa0ZU7kekDrW89BP/e7smcfjv
 qArrzy6vTZqTH2d8=
X-Received: by 2002:a05:6102:109c:b0:3f8:bbb2:941e with SMTP id
 s28-20020a056102109c00b003f8bbb2941emr3361368vsr.5.1675172289244; 
 Tue, 31 Jan 2023 05:38:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9e36IcXXodJOjJmIs81xqVvVEwzL/lrhs3UNjusoCVGAtwUX9m+iHIdajBZLrSt+vcDrkgBw==
X-Received: by 2002:a05:6102:109c:b0:3f8:bbb2:941e with SMTP id
 s28-20020a056102109c00b003f8bbb2941emr3361093vsr.5.1675172284077; 
 Tue, 31 Jan 2023 05:38:04 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 pe27-20020a05620a851b00b0071883954df4sm8423557qkn.103.2023.01.31.05.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:38:03 -0800 (PST)
Message-ID: <e6d8b6af-a390-39c5-8f0f-d9b7365341d9@redhat.com>
Date: Tue, 31 Jan 2023 14:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 01/20] hw/pci-host/i440fx: Inline sysbus_add_io()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-2-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 31/01/2023 12.53, Bernhard Beschow wrote:
> sysbus_add_io() just wraps memory_region_add_subregion() while also
> obscuring where the memory is attached. So use
> memory_region_add_subregion() directly and attach it to the existing
> memory region s->bus->address_space_io which is set as an alias to
> get_system_io() by the pc machine.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/pci-host/i440fx.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


