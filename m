Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BA646E695
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 11:27:39 +0100 (CET)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvGeI-00087B-1I
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 05:27:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvGb7-0005UH-Cu
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 05:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvGay-0004J1-T7
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 05:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639045451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYuxQj5HIVVYZMufDXtIO6Oj54zfcaWQLVfL9gF+3fI=;
 b=TVhYjtp+OQdId+RF932zonLKgUsqw4wxXHlw735f3sgvPew/Wmc9SfZ/AvbWTgecUGBHvh
 IOcHC0htXSo5P9IwOxNHXQnEVbZaHqVRELK0MyJAKFTEWtoFtoV+oMcn6wrO/l22JU4u82
 T1+wqgOE9FHgCVD1R/vTVShyQXddRbU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-EAd74vZuMDeAGZKZXIxI9A-1; Thu, 09 Dec 2021 05:24:09 -0500
X-MC-Unique: EAd74vZuMDeAGZKZXIxI9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 187-20020a1c02c4000000b003335872db8dso2921111wmc.2
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 02:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kYuxQj5HIVVYZMufDXtIO6Oj54zfcaWQLVfL9gF+3fI=;
 b=v1m9OfC/AUEo6OQO9dUEb5nAewN5kYeHK4rUpCFrU9K5sOmeZTQZ6Hf16XYzjTbKxx
 oOEbQ6QqVGT4Ak0srUHEEefVSN+VA/r0Zos7X/bPyJn9hQ8drwA0e0aLVt7axE/Lglof
 /p0g+Ba7MB+zPacHFKl+7uu+fYZPz3fujZRlcDo1opQSIVuyaXVtj5Bw1ZVsk9b8gby5
 BbURhxOkwyWz0LMF4NiAAeYcB6gWA/t78WOsdNsRFG+fylxRTyvt3Hm+JE7abERZUKUn
 rr4DiI8lLlUUKPT0Ks2CSCOyL+i/50lh5D6grPKgbOSbrZgb77p80aI0AAMA5/WwFybU
 FXzw==
X-Gm-Message-State: AOAM532YrurEGhEv3l9DWzINb7p7Iibf+EdeL0FK3fasi7KzDGq4Zoof
 okMjZLRKRn+w2vevFpAtRAbgj390juya7g6vbE/RLJ6E46e+xDq1PeztFlLixoiD7AwTivECFbZ
 OdB7GQmWyt50On1Q=
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr5348430wrt.88.1639045448776; 
 Thu, 09 Dec 2021 02:24:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTCIv/bndnkZNY/cj26NMLSQ6ieKpO6zOMuU9FPc5E5deG+ibldYuLAl0kW489zTTXzmuMTw==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr5348395wrt.88.1639045448525; 
 Thu, 09 Dec 2021 02:24:08 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id m17sm5108005wrz.22.2021.12.09.02.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 02:24:08 -0800 (PST)
Message-ID: <36c15126-b63b-742d-d2c6-f81fc0138252@redhat.com>
Date: Thu, 9 Dec 2021 11:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v8 0/4] tests/qtest: add some tests for virtio-net failover
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211208130350.10178-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211208130350.10178-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2021 14.03, Laurent Vivier wrote:
> This series adds a qtest entry to test virtio-net failover feature.
> 
> We check following error cases:
> 
> - check missing id on device with failover_pair_id triggers an error
> - check a primary device plugged on a bus that doesn't support hotplug
>    triggers an error
> 
> We check the status of the machine before and after hotplugging cards and
> feature negotiation:
> 
> - check we don't see the primary device at boot if failover is on
> - check we see the primary device at boot if failover is off
> - check we don't see the primary device if failover is on
>    but failover_pair_id is not the one with on (I think this should be changed)
> - check the primary device is plugged after the feature negotiation
> - check the result if the primary device is plugged before standby device and
>    vice-versa
> - check the if the primary device is coldplugged and the standy device
>    hotplugged and vice-versa
> - check the migration triggers the unplug and the hotplug
> 
> There is one preliminary patch in the series:
> 
> - PATCH 1 introduces a function to enable PCI bridge.
>    Failover needs to be plugged on a pcie-root-port and while
>    the root port is not configured the cards behind it are not
>    available
> 
> v8:
> - fix checkpatch.pl error (space after "(")
> - fix sanitizer errors:
>    * migrate_status() qobject_unref() cleanup
>    * release QVirtioPCIDevice with qos_object_destroy()
>    * add a missing g_free() in qpci_secondary_buses_rec()
>    * add qobject_unref() in get_bus() and find_device()
>      when an object is popped from a list.

Thanks, CI is green now, so queued it to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


