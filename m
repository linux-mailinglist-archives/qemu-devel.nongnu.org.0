Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EDA56673C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:01:00 +0200 (CEST)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fMZ-0000A5-Ba
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8fKb-00077V-0n
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:58:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8fKV-0008RU-Fm
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657015131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuLDgQ+lJxq01yD1VgvrOlniYIpqYS5Dvlw6G4y1eUc=;
 b=ZmJm8QIHEjqj9JoxQjDYjef/x/Lerv9Ev0IXhWVX+2l9bf6DTLJA47WDzsAP70eiCByD20
 pIrMKGwNO7cMUyAl1xgCc96EwmDn1gHQCONa0ZXzF4XS50tCJndq3AYpYUl4QadESlCocd
 3APz+rQeo1HxaSyo5ahSR1mm5V2GwmU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-MjCkK3-FOy-SGS-CwSJhUA-1; Tue, 05 Jul 2022 05:58:49 -0400
X-MC-Unique: MjCkK3-FOy-SGS-CwSJhUA-1
Received: by mail-ej1-f70.google.com with SMTP id
 e20-20020a170906315400b007262bd0111eso2568899eje.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UuLDgQ+lJxq01yD1VgvrOlniYIpqYS5Dvlw6G4y1eUc=;
 b=8K/xIf6+s2ycR+gALEPXXgYioKe9QO59/r9/MX37l27mwPWCBm5a/1C2prNaFlDjLb
 8CMbhVVB3KVYM27XURKgzbIEynZBqgIl1a1BItxj5xMYLrknqBZ7jSgxXiUQL/snNCeA
 77anAMRIqoiJcvsGfJ86u0a5KFl9KfOe1fQRkzGdQ5uJAHQH1OD4kOirqlmgXkEphWQd
 hUNyP35m4YgisMNfqX2wdUfvbEV/YBDdwmjinTagBi2LakF/Qb8A+y4FWRKiepFLXJ5N
 eQPu09LT27zS6zjwSR3ty6BA5+mzNWgDCw9yxwvCdvJ6uhEGZ4KDYnx21pbIWYrsmo9Z
 yk7Q==
X-Gm-Message-State: AJIora9leX+3+qK6QGfEMFOwSDSo6MkDlzQ5SDeQp/PChotXHvYNFCf6
 3odSw/Fmdh17x9W0EGei518WnLTL9I0WteGRD2lgqxxYfsxGbNuu3NFWJjstpa5t4f+KLPH8sY3
 xUUvYcQ2J2Umnpv8=
X-Received: by 2002:a05:6402:1741:b0:433:4e4d:bfb4 with SMTP id
 v1-20020a056402174100b004334e4dbfb4mr44292628edx.7.1657015128216; 
 Tue, 05 Jul 2022 02:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u6Rk0CJgTZoO4ahvfa9RSO+bzRJotKetYrL8qiIdTV8HRPqny9ZeB4DGVI5XC9WYaViZqGjg==
X-Received: by 2002:a05:6402:1741:b0:433:4e4d:bfb4 with SMTP id
 v1-20020a056402174100b004334e4dbfb4mr44292597edx.7.1657015127895; 
 Tue, 05 Jul 2022 02:58:47 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 fj21-20020a0564022b9500b0043a45dc7158sm4652739edb.72.2022.07.05.02.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 02:58:47 -0700 (PDT)
Message-ID: <308c543a-5f72-b0f4-15d4-b98d4db6f4f2@redhat.com>
Date: Tue, 5 Jul 2022 11:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Failure in iotest 183
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <f629134d-0ce2-46df-13b5-30b735f6bd3d@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <f629134d-0ce2-46df-13b5-30b735f6bd3d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.22 11:35, Thomas Huth wrote:
>
>  Hi!
>
> I've just hit a failure in iotest 183:
>
> --- /home/thuth/devel/qemu/tests/qemu-iotests/183.out
> +++ /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch/183/183.out.bad
> @@ -30,7 +30,7 @@
>         'arguments': { 'uri': 'unix:SOCK_DIR/migrate', 'blk': true } }
>  {"return": {}}
>  { 'execute': 'query-status' }
> -{"return": {"status": "postmigrate", "singlestep": false, "running": 
> false}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}

Weird because query-status cannot return something with '"status": 
"completed"' in it.  We can see the '"status": "postmigrate"' object 
somewhere below, so it seems to me like the silent=yes part for the 
query-migrate execution didn’t work as intended.

(And it does seem to work below, when waiting for a “100 %” to appear on 
$dest.)

It’s been a while since we’ve touched common.qemu, so nothing comes to 
my mind immediately that might have broken this.

>
>  === Do some I/O on the destination ===
>
> @@ -53,8 +53,31 @@
>  === Shut down and check image ===
>
>  {"execute":"quit"}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"execute":"quit"}
>  {"return": {}}
> -{"execute":"quit"}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 
> 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, 
> "postcopy-bytes": 0, "mbps": 188.63209192200557, "transferred": 
> 496829, "precopy-bytes": 496829, "duplicate": 32849, 
> "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 200704, "normal": 
> 49}}}
> +{"return": {"status": "postmigrate", "singlestep": false, "running": 
> false}}
>  {"return": {}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds": TIMESTAMP}, 
> "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds": TIMESTAMP}, 
> "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
>
> Is that a known problem already? (I haven't seen anything
> related on the list)

I’ve never hit this so far.

The only things to try I can come up with would be to bisect, or to try 
adding `silent=$silent` to the `_timed_wait_for` calls in `send_qemu_cmd`...

Hanna


