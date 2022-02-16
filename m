Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC34B922E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:19:23 +0100 (CET)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQlm-0002ks-Au
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKQfm-0001VB-M2
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:13:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKQfd-00022X-NS
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645042370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5n+WsLQTuBfuwJpTI26P5HLNyqbTiT+7Xr6HNf/Wmo=;
 b=RfQLxPIJ7h7WmflE1sD+BwpQMwpi7v6kAtX0r5f7VM6BQ/SfcfPoWHTeCljLr0AWmtVEWj
 aSFgbYWxBAzbsnRHtRjsnQLQwQ7ATZ/xcdqU2MmVUQtTgIF2DMM66ytjpoD7dpvk7wTCwR
 WrC/dYjmKzPhNlBzqCOK1c1hrPukZh4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-uMm8gwqGNHy4ixypWucdlg-1; Wed, 16 Feb 2022 15:12:49 -0500
X-MC-Unique: uMm8gwqGNHy4ixypWucdlg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n26-20020a05600c3b9a00b0037c524e6d97so836719wms.9
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 12:12:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=B5n+WsLQTuBfuwJpTI26P5HLNyqbTiT+7Xr6HNf/Wmo=;
 b=QdR/BffJE5eON0tMcB300vWiDyB5kWlquYTo6WCCExU4hwO//HEFdcvOOyEmKEY1Ft
 G/9NJzAb9aA0cc4ekINVxQWXhVMA8q15PjdTWcB8jrdIeC7q1vhjPkI/aBJPpA3T1LM2
 7OvZnwV4dzQqr5RZs36WAfXWKp8N3ZE5py3ijqm9dyhMrHzqhcf9WFlyWO3ejhvc3M1W
 3BJDgPWM8ksiAt9mKvvvMuEpfExhz/JbEIoxtjjr9vK06+2RytQ7zQ51XgWNNTCdrxHK
 5YV89s3z+kcvY1WGBtvx319cNdZqNeMIx41898OGb6DpekdGFjZu76qylsApw3MkWRXO
 xxeA==
X-Gm-Message-State: AOAM532hzTHznt9a32HzhzSWE8tLtc68vTONCsbsPhsY+MCbgBjEakal
 vDT8ZUBkGiyS1OOE1w/4XH7IdajeUuensLgHP6bOG9cnEZf/QZYmhU58xnwdGMXkkQiD4WI0o9c
 pb5y2gmzePZaqC3M=
X-Received: by 2002:a05:600c:1e22:b0:37c:3653:d471 with SMTP id
 ay34-20020a05600c1e2200b0037c3653d471mr3128435wmb.175.1645042368427; 
 Wed, 16 Feb 2022 12:12:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHFGsXmppmBd9oYIlAzhBklfMPT4apKwhdMdFqL3TcTmXxGI5mubYlzbJ+lVrYg7qvU63xPQ==
X-Received: by 2002:a05:600c:1e22:b0:37c:3653:d471 with SMTP id
 ay34-20020a05600c1e2200b0037c3653d471mr3128409wmb.175.1645042368131; 
 Wed, 16 Feb 2022 12:12:48 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id x11sm18524177wmi.37.2022.02.16.12.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 12:12:47 -0800 (PST)
Message-ID: <ef86b83f-2ba2-42be-1f11-e3086761b803@redhat.com>
Date: Wed, 16 Feb 2022 21:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] s390x/cpumodel: Bump up QEMU model to a
 stripped-down IBM z15 GA1
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220216200355.128731-1-dmiller423@gmail.com>
 <20220216200355.128731-3-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220216200355.128731-3-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 21:03, David Miller wrote:
> TCG implements everything we need to run basic z15 OS+software
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>

Booting Fedora34 with an upstream kernel (compiled for z15) did work.

Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks!


-- 
Thanks,

David / dhildenb


