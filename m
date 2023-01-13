Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4386D66A137
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGOC0-0006rU-5h; Fri, 13 Jan 2023 12:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGOBx-0006po-J6
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:50:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGOBw-00012e-4Z
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673632211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lpl3Ul8rzmO3UVeC+Jwwn8RR19sGfsrIc4CWuuzMTB0=;
 b=idrn4l8BRlrYdav+0cJ/2fNAEEeWAuaXKc5EH4n4nSBUojgUlw3483oT0C5A2auS7kdRAF
 2WxOGGTkjEOJZoJOZlM6B0VFSp4ZJRWfhSKzshoYLwTo2ALXac7fYqsvaHVNnE3jOHIvVV
 kdk3BIAhM9W0a+nCOR+wLhhIyMTPGzY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-5to-_XuvOTeb55XjpO-gew-1; Fri, 13 Jan 2023 12:50:07 -0500
X-MC-Unique: 5to-_XuvOTeb55XjpO-gew-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso14531114wms.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lpl3Ul8rzmO3UVeC+Jwwn8RR19sGfsrIc4CWuuzMTB0=;
 b=oe7F1ekwhj0CjjaWsy6AhQeT5JXicRjY8PPqIeBrzibKArd4fSPOW+yg4hv33KvIWI
 mHlIIpbJKq1YgVvYYMOnOI7gqs3DZ2A0i8J2+cRGXJRrc+ugBM3dJTbBfiig/ZKXX7aT
 /SizmuuLCT9bpPlUhgDCcQTgXxcpAnn6cg/HfQ8DAhY475y/lIHp6XXE3clJRJ/IYSfi
 YWHGCCEW1myJOm5sjs/vHu+RQnmRP6h/Kk3ZHyK37rMbKocH6EbCt9BuE32qRefCbnLI
 8L1RO8e48KIZoRQASpkyElnva6RSofSxKKSJ8Qwx/dL7NE5ulgJ8QleZEQjYDpChwwNP
 mucw==
X-Gm-Message-State: AFqh2krzT9FM1SKZD5GR10J2XHVYWsfYP4OHPv/KaxUpeNJr2oJChfip
 l2mblhgcFN5FBxlV4KrQWZnxqG2EPSUrp6tZIja6GAPZIMvuyDAPB6bgDjQkh90OgbweriD7Ysq
 d35Ja57gRSuYlI8M=
X-Received: by 2002:adf:fe90:0:b0:2bb:a83c:efc4 with SMTP id
 l16-20020adffe90000000b002bba83cefc4mr17373034wrr.7.1673632206608; 
 Fri, 13 Jan 2023 09:50:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuKV2QXPzS2dnI5Uxidv3bbVnsFXBT8MwSzKruxRVSfdXjsmuieUhuH2kZnJKQwtH1eK6Xqkw==
X-Received: by 2002:adf:fe90:0:b0:2bb:a83c:efc4 with SMTP id
 l16-20020adffe90000000b002bba83cefc4mr17373020wrr.7.1673632206391; 
 Fri, 13 Jan 2023 09:50:06 -0800 (PST)
Received: from [192.168.8.100] (tmo-099-226.customers.d1-online.com.
 [80.187.99.226]) by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002bb6b45ab57sm17536871wrm.85.2023.01.13.09.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 09:50:05 -0800 (PST)
Message-ID: <2b7d4672-ae00-ecdc-ada7-a27abd156b5a@redhat.com>
Date: Fri, 13 Jan 2023 18:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: DUO Labs <dvdugo333@gmail.com>, qemu-devel@nongnu.org
References: <bb8202b2-a4a2-8325-8ac7-92ccf7f41162@gmail.com>
Cc: =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Exposing Mac Host Internal Microphone to Guests
In-Reply-To: <bb8202b2-a4a2-8325-8ac7-92ccf7f41162@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 30/11/2022 17.15, DUO Labs wrote:
> Is there any documentation on creating a new microphone/camera that can be 
> exposed to the guest? I'm thinking of writing one to support MacOS hosts, 
> but I don't know where to start. I see that there's something called QOM, 
> but I'm not sure how to use it.

There is some documentation available in docs/devel/qom.rst ... and with 
regards to audio devices, you could have a look into hw/audio/ if you can 
find something similar to what you need.

Hope that helps at least a little bit... (sorry, audio is not quite my turf),

  Thomas


