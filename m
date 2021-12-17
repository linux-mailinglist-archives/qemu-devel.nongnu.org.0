Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C47147949E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 20:11:36 +0100 (CET)
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myIdi-0000sd-P3
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 14:11:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myIbl-0007rI-Cl
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 14:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myIbW-0004xA-Lc
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 14:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639768156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICEEOwRisf5dL7E24ihRPVkRza39z3+gkZlXgPMouWE=;
 b=MwTit7+5GADZUhHxWH2fof3V5qNSHFeqiwEjWJpdhP+N3lCr3jhIvm/SssEtdS0G+Zzckc
 NTfBESsksbCSuFO5Dbqw7nrIYpvxNAy0Gm5kpzcx+XMl/scavzVHXOliezM9VOq9tn7ful
 hvSp5ZA8Lf7/n7GtNERptx7sh+LrCys=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-l_NW1nw1OIqdDAipDopl8g-1; Fri, 17 Dec 2021 14:09:15 -0500
X-MC-Unique: l_NW1nw1OIqdDAipDopl8g-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so1453635wmb.4
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 11:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ICEEOwRisf5dL7E24ihRPVkRza39z3+gkZlXgPMouWE=;
 b=FpXsxmMNzReKxkndDUQWMwrfZ36DXzXj4WHTqYUMf2nGSe+nDo/ZN4yW4gwRb/9fPb
 6plIgO68aei/+3lrEsNvFX4PA/HFbFyupVo85gPaMYQxtp65iP5ZhICeoHC1rfL3NsLg
 EMsKTOXetUhhxTTvXStPkiZZPH8WdlUbTjdnoOnTdk2Cz2CJzprD7Tfuuf0xcgM0xM+F
 +G6ZLyg2101mD1r/jhhaZ2/yWQQsei3C1PuLy+O+ZHfEEpR58CEor6WMB4hTPG6wZ83l
 Sv/nuobB2LnjS/8F9vZUUsVjZGyGU5W/xIItZLJzaAZRRPZCZedBdERAg0eYID1dcfcb
 kgAw==
X-Gm-Message-State: AOAM5311Z8Hc39zvYUekJPLAxjhuFsO2OpDYgFye9VCbpXDe4I8Gm1yT
 uku9X8vWd1BQvuysBCOvo3uQmiyeZhvyJtofxi4uLadPZREFFmHjWcBukpPSj32sN+kpr9lzr66
 fP9WRcJouLpBKCWM=
X-Received: by 2002:a5d:668a:: with SMTP id l10mr3633680wru.654.1639768154297; 
 Fri, 17 Dec 2021 11:09:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx16bpsp16KHsvD8p31LheAcbnYKHKzteLeu2bdnvkK1hNs8x9Zi8+py0ZWrkYqVLW7gdQjQ==
X-Received: by 2002:a5d:668a:: with SMTP id l10mr3633668wru.654.1639768154130; 
 Fri, 17 Dec 2021 11:09:14 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id x8sm345048wmj.44.2021.12.17.11.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 11:09:13 -0800 (PST)
Message-ID: <1ecaa8aa-3b5c-ed91-3326-78376e4fe995@redhat.com>
Date: Fri, 17 Dec 2021 20:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC 1/2] migration: Introduce ram_transferred_add()
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20211216123420.1328937-1-david.edmondson@oracle.com>
 <20211216123420.1328937-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216123420.1328937-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 13:34, David Edmondson wrote:
> ...and use it.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  migration/ram.c | 23 ++++++++++++++---------
>  migration/ram.h |  1 +
>  2 files changed, 15 insertions(+), 9 deletions(-)

> diff --git a/migration/ram.h b/migration/ram.h
> index c515396a9a..a5b2ffdc18 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -51,6 +51,7 @@ int xbzrle_cache_resize(uint64_t new_size, Error **errp);
>  uint64_t ram_bytes_remaining(void);
>  uint64_t ram_bytes_total(void);
>  void mig_throttle_counter_reset(void);
> +void ram_transferred_add(uint64_t bytes);

Why make the method public? It seems an internal operation. Do you
plan to use it elsewhere?


