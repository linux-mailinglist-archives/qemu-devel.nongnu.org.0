Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A100414F58
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:42:36 +0200 (CEST)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6GR-0008AB-4N
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6Bv-0006LO-Dr
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6Br-00052x-S8
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632332269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1l0AiXwDhCyCu/u0vTki8Ygujm+OCz4LudDX2/nmkU=;
 b=O3ocui0qCFzw/Q8mEsUfC9BGpUhdsun9gDBL8u9hgwcjKNWX2tjdxEIpNbHE6gWTMaLU+I
 pwRit7KWC6mhJrQf7pl+wPde8Km5Xh3q/pnD50zq103BuMoawBM19flDfe4i7ce7weitsR
 P5J9euhmmCcBMe9fa3vxcjsNxLBuk3Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-Y_Tfy1FKPtC2fAX3pm1U8Q-1; Wed, 22 Sep 2021 13:37:47 -0400
X-MC-Unique: Y_Tfy1FKPtC2fAX3pm1U8Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso2858457wrg.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w1l0AiXwDhCyCu/u0vTki8Ygujm+OCz4LudDX2/nmkU=;
 b=N1PJyXCuNsa0o+UtwRliWuW9sgez7HlRX6E/Umt8hx98U4gK2q3CI16TXcHx7djIUE
 nlOjE+dGSai7ZZ09ML/BedfAKvJVT6ZNjrmeg1uDtdjNqi5EaGPQLitsD9nZYmnzWU2L
 IMwsET2MUT4IW4lOnCHN/DJpLRlisJM3KPrLv/wGORyxV5lTrwgkwTOo1i1UrHLNfqhq
 IqSP3RyvmO4Abv598UK0ZdSCWofqfegVwCRaSYyT30qnfxk6CMwpYXSdJVEqb5Ar81xm
 JTyyfXWO4oMrn0NIXEtdspjeyyCqs9jXKDzUxtiGNKoPAPPptjozsld4/lSoAlK+YteP
 S5Zw==
X-Gm-Message-State: AOAM531SFhKXsobdvN8M+jpP6VtuibvShTXL/CWEfzAGW7Oou859uzDj
 MNsM7D/uD7BbWwzv/DAKoWtqFUs4j149rOtrvHOLi8t/1+d6sK3z0Ss3E2eikMXBqfmLGfmkJCZ
 WYj7jLlUrUEEz2ms=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr12223529wmg.88.1632332266708; 
 Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg6vmpdLqfWALQ+aYScr0ufGB6YbggOHa9PzO72FTcIBc1TC/o6Tu07FmCA0vADFzchZXYUQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr12223500wmg.88.1632332266506; 
 Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v10sm3041925wri.29.2021.09.22.10.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
Message-ID: <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
Date: Wed, 22 Sep 2021 19:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP
 command
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922161405.140018-3-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 18:13, Damien Hedde wrote:
> From: Mirela Grujic <mirela.grujic@greensocs.com>
> 
> The command returns current machine initialization phase.
>  From now on, the MachineInitPhase enum is generated from the
> QAPI schema.
> 
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Missing your S-o-b, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
>   include/hw/qdev-core.h     | 30 ++------------------
>   hw/core/machine-qmp-cmds.c |  9 ++++++
>   hw/core/qdev.c             |  5 ++++
>   4 files changed, 72 insertions(+), 28 deletions(-)


