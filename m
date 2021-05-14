Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64F3812C3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 23:18:33 +0200 (CEST)
Received: from localhost ([::1]:58396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhfCb-00036R-16
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 17:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhfB5-0001ag-V4
 for qemu-devel@nongnu.org; Fri, 14 May 2021 17:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhfB2-0007bH-Sa
 for qemu-devel@nongnu.org; Fri, 14 May 2021 17:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621027014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMvRVibVRONG+nhjNeIHKOxsEC8rNkYgzUcnHqElqO8=;
 b=XQhmgLlPkt3g5IeBbnKgF/v2ZuGBUdj6nhcIpN4dr9MnJN1ZyF4xUTVKEhXgwklGN8jJMg
 XTpWsRBcebiEKekRJzrmaQd9MJ5+5SFXh3VGZ+IYY+Ap185qWT7/YSdHwCVsJGEwTjFt0J
 yzTgv2TOq9MHlZsnmR2q/9k0Em8EWlY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-lUumJo_jPFCl1Oog7NkyiA-1; Fri, 14 May 2021 17:16:52 -0400
X-MC-Unique: lUumJo_jPFCl1Oog7NkyiA-1
Received: by mail-ed1-f71.google.com with SMTP id
 g17-20020aa7dd910000b029038843570b67so48483edv.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 14:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eMvRVibVRONG+nhjNeIHKOxsEC8rNkYgzUcnHqElqO8=;
 b=E0fZpN6yr4z7cQsAGNpWallicdg2CBnjNfDVaEAvOR6X15PdnnQ7bLEuu5SF2PLmpI
 B857priKEHMZ58aeNJiy6uY25JhvQRptGYBWABX2T0CBkNWWp3C2WOJRG0/Eh5R15taC
 8oYtM0rQ//5DQGdbz0S+wMZ1pMckPthvL6TX6b0hhqBneNSqD7T10pelUAPPBg6TcNrU
 7KCoW2Uc6K8gahp+WIn+ndylqmY5udJAN7257lRd69Jrd9Vv1e3lcVLW56SykXcHxvea
 ojfwxgOBB0/r6NBLUFiop8NkQOq9sztkM0wL3+p+Vqtr/biRg+LdpNHJjvdMAgFhOguy
 z24Q==
X-Gm-Message-State: AOAM531vPHNT+cwpJj7XPfwyGkeHTLqfS22+fraAeX0A5Pg8YTkmTxld
 M98+xtcRUVsCnEXQAnp/Nakp9Warrui1Wm2Rewr88UKEyg9dplmzDbCmjZ9+0o4T4jFiNez0B1h
 h5xSGFuJ0slSjqHE=
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr56932350edb.81.1621027011715; 
 Fri, 14 May 2021 14:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQnc3jcwKrdyIBp04vPzbxzAdJD5UqO0q7pgbcIM5H/nbee5GrLwAKmPrBL1j8VwLFf+dtPQ==
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr56932333edb.81.1621027011506; 
 Fri, 14 May 2021 14:16:51 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id y8sm5146614edo.90.2021.05.14.14.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 14:16:50 -0700 (PDT)
Subject: Re: [RFC PATCH 2/9] replace machine phase_check with
 machine_is_initialized/ready calls
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-3-mirela.grujic@greensocs.com>
 <dcaf4794-0661-afae-a256-5043be20aa5b@redhat.com>
 <164d41e2-262f-0dab-17d6-c280428687cd@greensocs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dd18ebb7-9583-86b8-e368-afef3b71e5ef@redhat.com>
Date: Fri, 14 May 2021 23:14:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <164d41e2-262f-0dab-17d6-c280428687cd@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 mark.burton@greensocs.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 15:13, Mirela Grujic wrote:
> However, if you believe it should rather be just renamed I can do so.

I am just not sure it's such an advantage to replace phase_check with 
separate functions.  The rename is a constraint of QAPI, so we have to 
live with the long names.

Paolo


