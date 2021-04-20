Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7265636562F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:32:22 +0200 (CEST)
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYng5-0002y9-Gm
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnb5-0007T5-9L
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnb3-0006g3-Mf
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618914429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDWWCzy83tJjUkIUeUF1DACxPFxJPikht2rBFSh4XIU=;
 b=TQVjjygLpuMaI2/2vp2a6MhBRCtrpc3WLcjM8ab96LSnp+9Sxb4ovEnE3uITCCjJSoUjBk
 gBQNGAI2A0QQ+27/YeAK+NCNsRPInf5/i2WWoXozstpjH7FWJe0JKrRmbLTiXNPDXSkL5N
 SP+7QNsjeGJ7Wi8IXMZkO0ISCrpMYFE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-36XW87tkNjGp6b6pBHRmlA-1; Tue, 20 Apr 2021 06:27:07 -0400
X-MC-Unique: 36XW87tkNjGp6b6pBHRmlA-1
Received: by mail-wr1-f72.google.com with SMTP id
 f15-20020adffccf0000b02901028c7339ccso10665473wrs.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bDWWCzy83tJjUkIUeUF1DACxPFxJPikht2rBFSh4XIU=;
 b=k3QYqNiVSdnZYLi6s4pkZBku6nKcIbEFvBlizeW+FCYaSHDqr7w21R36/ja6w7Dyp4
 MRt2zYNAuXnNSWSK33maFilN+v4ojbOoTIA4U1/fQjSD0/Miex8Y5io2dRDNX4+oDBVx
 eRXnYy6Z74782IuwQLmUuqA8IwDQMTg8yH+1lH3F4ZYRkMyCeFtACE4H7hxNa3lJHhLz
 5L1MzYMjYWt2xBGMmpJ/HHBlcVE2c9+MiCWUDruEkzNbeXJXz7ZEQHqhj39ef42BSwuH
 zkhJ5wejqrNbMiU9i4l3MhKXsQwFUO7Wz9UexuFW9kj1FG3l+ZSf48AwCxreXmg0U8WD
 vVWw==
X-Gm-Message-State: AOAM530okB278HbXfLkJNUbxv0cCCPGZKZzhWMjyZfLZphDfmWa7a4Rr
 4ftnXniEiYzdaoHkcLJGhn9H1hfEEmoXNr02QwVuCV34R/mPFeaADBn+SfgKAPx8+sKSEhQiqIa
 qaBEPf0zVMUg9Zfs=
X-Received: by 2002:a05:600c:2148:: with SMTP id
 v8mr3644076wml.167.1618914426204; 
 Tue, 20 Apr 2021 03:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXr8QBq6Owv8rI3/h3QOyQt3sYceVmbc6kQZTMqszMDKzyH1URAqqgjR0aWKNsckSAH4gQ4w==
X-Received: by 2002:a05:600c:2148:: with SMTP id
 v8mr3644063wml.167.1618914426043; 
 Tue, 20 Apr 2021 03:27:06 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o17sm7636909wrg.80.2021.04.20.03.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:27:05 -0700 (PDT)
Subject: Re: [PATCH v5 10/14] qmp: Clarify memory backend properties returned
 via query-memdev
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-11-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d690e10d-30bb-76cc-b7bf-17bcd950f91a@redhat.com>
Date: Tue, 20 Apr 2021 12:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413091421.7707-11-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 11:14 AM, David Hildenbrand wrote:
> We return information on the currently configured memory backends and
> don't configure them, so decribe what the currently set properties
> express.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  qapi/machine.json | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


