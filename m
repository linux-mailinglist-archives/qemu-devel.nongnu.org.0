Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7A4F7B84
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:24:10 +0200 (CEST)
Received: from localhost ([::1]:56142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncON7-0000bu-7a
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncOIz-000685-V9
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncOIy-0005ot-Fw
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649323191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10cMpnNULOzNbEzRtqBoG0kPYV7WiL87wG67G9FuFrE=;
 b=DwSO/z+wY4SlAUffKmHn/fxPsRs5tfXAodYp5OzLS69rRRSRbyK9JIieUcPgvgW4ppzdWf
 zinao51b9k2T/5z4/yTrTvTQAzJL+5WNbY7hiTAsX4De8VIHRSZKB3mxySzweIgTZkV2Xg
 l6AC8y5AqNW0lD7S2oAOpPX38somXfU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-OA97wr1BPFSiLIsUB6T8HA-1; Thu, 07 Apr 2022 05:19:48 -0400
X-MC-Unique: OA97wr1BPFSiLIsUB6T8HA-1
Received: by mail-ed1-f72.google.com with SMTP id
 r15-20020a50aacf000000b0041cd4f5e1a6so2628982edc.4
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=10cMpnNULOzNbEzRtqBoG0kPYV7WiL87wG67G9FuFrE=;
 b=llhc5yw+RQ3bi6YWb5oa7HoWYeF5b1vZdItECyPsyEvjlv7pS80YQZULa/S3Ihuzzi
 gylNOZ+DiEKQOUkmpG+i6Pkudr1rLWWY8CTRVFXuhF6JC1Gyy/2IeMUdJt1RbhM1DSyi
 Wf1JebDE4O1s/NlYBdLvV64ExodHZgw0rSPpgsHbUtJL8TNFSi2un3oiot19EIAvseiG
 clIOvQoEy0KPiT3Nrab24qnMbOM/Btw95wOQAa7MN/AsNPL3IcLSET29ykPLgmV53vRf
 9ayVlS1mXmWynMafNc02x5RQqC4nIZZaYdAGYstaRmVd8rOCHjisSI7FYxk1tiwSJZW2
 MMUg==
X-Gm-Message-State: AOAM533x/nhXZP6k+/vCfE/sMEM5pa2v0rxxRcZEm2mYxNq5AxgN512Z
 H7GSa9bgYhZyY3VK3cE88ZjVtg71n6zVRrxQOnLc9c6F+atYTpHU4wY9++KtTcj7/1E2GeRZziq
 sCfqTWnedQ71oVUA=
X-Received: by 2002:a05:6402:687:b0:41c:dcfa:4f19 with SMTP id
 f7-20020a056402068700b0041cdcfa4f19mr13292464edy.258.1649323187406; 
 Thu, 07 Apr 2022 02:19:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNeYNMpDffjD4jsaf13bMFcUQEtNI8eNFcd5zu7aE0fj5dG+2TOjaIdKI91ezgIzu3SwOSxw==
X-Received: by 2002:a05:6402:687:b0:41c:dcfa:4f19 with SMTP id
 f7-20020a056402068700b0041cdcfa4f19mr13292432edy.258.1649323187112; 
 Thu, 07 Apr 2022 02:19:47 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 jl11-20020a17090775cb00b006e7b1c5cf81sm5064855ejc.189.2022.04.07.02.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:19:46 -0700 (PDT)
Message-ID: <ef6800dd-d041-0169-6f07-cab3c3dc4045@redhat.com>
Date: Thu, 7 Apr 2022 11:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 7/7] iotests: copy-before-write: add cases for
 cbw-timeout option
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220406180801.374844-1-vsementsov@openvz.org>
 <20220406180801.374844-8-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220406180801.374844-8-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.22 20:08, Vladimir Sementsov-Ogievskiy wrote:
> Add two simple test-cases: timeout failure with
> break-snapshot-on-cbw-error behavior and similar with
> break-guest-write-on-cbw-error behavior.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   tests/qemu-iotests/tests/copy-before-write    | 78 +++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>   2 files changed, 80 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
> index a32608f597..5c90b8cd50 100755
> --- a/tests/qemu-iotests/tests/copy-before-write
> +++ b/tests/qemu-iotests/tests/copy-before-write
> @@ -122,6 +122,84 @@ read 1048576/1048576 bytes at offset 0
>   1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   """)
>   
> +    def do_cbw_timeout(self, on_cbw_error):
> +        result = self.vm.qmp('object-add', {
> +            'qom-type': 'throttle-group',
> +            'id': 'group0',
> +            'limits': {'bps-write': 300 * 1024}

Hm, yes, I can’t find a way to make this work without your other 
series.  For some reason, not even -accel tcg helps; and using qtest to 
advance the virtual clock doesn’t really help because the qemu-io 
commands block while the request is throttled.

One thing that should work would be to run everything in a 
qemu-storage-daemon instance, and then having qemu-io access an NBD 
export...


