Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E366B9F8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:14:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLZ3-0005kz-PT; Mon, 16 Jan 2023 04:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHLZ1-0005kn-CP
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:13:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHLYz-0002BO-S4
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673860436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcI8GgnMQJ8080p6zcRl74e3BhRJvEP8FRq4eAEC1sY=;
 b=KOMoal1tHMgz5OhsAPU+m0ZnmcxkvqVBAQgaP3K7bWHb5XAiLYr0cOVmE7rixVs5fi10ZE
 TgYTRC28euaao394hx/TrRoEszCCdR3Fi/VJ2dBnLU4sSBPHuF/9a6WF5DfqH2HP0/2wfe
 /f67iERLJtAzGor8NGwVtLkJhuW2hyQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-gjGSOuwHMhOeARO6l9OEFQ-1; Mon, 16 Jan 2023 04:13:54 -0500
X-MC-Unique: gjGSOuwHMhOeARO6l9OEFQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v20-20020adfc5d4000000b002bdfcdb4c51so469188wrg.9
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UcI8GgnMQJ8080p6zcRl74e3BhRJvEP8FRq4eAEC1sY=;
 b=7xShZPcSGA1gIZpEWp9rtxsXjXz8AbheK9dIpxgIAUttpyOKiLerFy1g+dukoY8xhF
 buG51sdQI6jb2RRtylITa9LfouFX09OjifKyTr0spRR+rSVY59otm4xl4lF4MdwYOVNu
 LXX6AQYof9qe0+yNUP8CeavgGBE+2K13Kvn7lM5PM+CkmUTA4MUXHdAoeqjFIieGzXY4
 rBOApfJ4N6mevElIaaC2WKcgm2LiYmW5IC9wP6Xe8lHzgYi6YTXSEDC31hbf8k1g6cYq
 jghIMvvaSEXFOb99heXqEDgLSaC95HaJOWMqYSFTKjoWThfi2gHaMBOetHCSJTBfTZbR
 YlxQ==
X-Gm-Message-State: AFqh2krCuxJs8qev46oucDThivhRrmr6nky2f0vqa2K8m9VpyTob7iPI
 be9KBAVE42mYDeqAlQVqXbuYfW3q//tmARLz4846ArdDjuF70BonbTiPVgr4MumIAY915EsxOqE
 a2Vz+RVFFnXynTzHVZVfpxKhlT7ZXx47ebdy941iM1A441rGWix+kWYVx0YLXau8=
X-Received: by 2002:a5d:58d4:0:b0:2bd:fdce:f206 with SMTP id
 o20-20020a5d58d4000000b002bdfdcef206mr3599815wrf.2.1673860433860; 
 Mon, 16 Jan 2023 01:13:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsaODXS/Y+4jearp0xndSg8bMRVjq5bReOJ1Xj3r56Uaa7llAjKGRKE1YjDK+cngIZoZYAgTw==
X-Received: by 2002:a5d:58d4:0:b0:2bd:fdce:f206 with SMTP id
 o20-20020a5d58d4000000b002bdfdcef206mr3599800wrf.2.1673860433613; 
 Mon, 16 Jan 2023 01:13:53 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-109.web.vodafone.de.
 [109.43.177.109]) by smtp.gmail.com with ESMTPSA id
 by12-20020a056000098c00b002bdd8f12effsm10378221wrb.30.2023.01.16.01.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:13:53 -0800 (PST)
Message-ID: <3343fe22-9126-8f22-8a9f-91b9bf169d02@redhat.com>
Date: Mon, 16 Jan 2023 10:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/vm/haiku.x86_64: Update the Haiku VM to Beta 4
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>
References: <20230116083014.55647-1-thuth@redhat.com>
In-Reply-To: <20230116083014.55647-1-thuth@redhat.com>
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

On 16/01/2023 09.30, Thomas Huth wrote:
> The old Haiku VM based on Beta 3 does not work anymore since it
> fails to install the additional packages now that Beta 4 has been
> released. Thanks to Alexander von Gluck IV for providing a new
> image based on Beta 4, we can now upgrade the test image in our
> QEMU CI, too, to get this working again.
> 
> Note that Haiku Beta 4 apparently finally fixed the issue with
> the enumeration of the virtio-block devices (see the ticket at
> https://dev.haiku-os.org/ticket/16512 ) - the tarball disk can
> now be found at index 1 instead of index 0.

I just noticed that we should now remove the related comment, too:

diff a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
--- a/tests/vm/haiku.x86_64
+++ b/tests/vm/haiku.x86_64
@@ -80,7 +80,6 @@ class HaikuVM(basevm.BaseVM):
          "ninja",
      ]
  
-    # https://dev.haiku-os.org/ticket/16512 virtio disk1 shows up as 0 (reversed order)
      BUILD_SCRIPT = """
          set -e;
          rm -rf /tmp/qemu-test.*


