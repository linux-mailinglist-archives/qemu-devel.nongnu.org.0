Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B093867509C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 10:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInXg-000649-Ep; Fri, 20 Jan 2023 04:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInXe-000633-4u
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:18:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInXb-0006lz-UO
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674206309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtzrJ+l4B9zV3u2sa+uUnRCTxQyt9aXx6lcKmJ45EPs=;
 b=DdtU6SWzhjDg6AcLyPAeMw19NNswtBurFs2OvAkSM9O4sifN46Ams18obw/WWn7oubUUfw
 tlpTfBFI+yoyCIGTVW0lthFRCNF1OgFb/V3TvkwjKEmSfHdnfkS+YRzjXpxAbOSgqZ+UV6
 HvBPy3sRmZSjQ4usjpqsWU9NS9ktCtU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-qfyxEMEONYyZLl_HCI90zw-1; Fri, 20 Jan 2023 04:18:28 -0500
X-MC-Unique: qfyxEMEONYyZLl_HCI90zw-1
Received: by mail-qt1-f200.google.com with SMTP id
 a13-20020ac84d8d000000b003b63a85ae73so2160237qtw.21
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 01:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KtzrJ+l4B9zV3u2sa+uUnRCTxQyt9aXx6lcKmJ45EPs=;
 b=itPC2oVpZfQhtk40TLlDWWk6AVENevxdmpZ5DDuhDWWqlkRIi+PUdfyG9Purx5Gxqu
 4TyMG5AxtfJf1BT6nL1DlkruPSf/k2FIjU7h0W/p0t0cINL30KjByMx5AdJv/h8co3r6
 eOxxVWa6Qf3tiHdRHu7SCSFqTrg5yPZ8gzm1HxTEjSUoZXZlrxj/dbVEB0vKpkcTcudS
 Xqvm723aqKU0WCHUpBvBshYUOASNnMLc+Hy3ZH1j/RCluCm3WMnBKfxoPony69Tk7Upj
 9ul56bib7Ry0oXrP9Ea0mJa9DGOWHpwvVtLPOFhZXtavIlsOyMszCGOZr/RsxQXqH+IL
 UwuQ==
X-Gm-Message-State: AFqh2kqNfzJiXyXcFPIHv5nQ3Gc1dQH+1Zq2lGegdbiaNccVNLdwVlba
 P4TyM/2ZKLBjftPZ9OsALAr0VnewvE4qGQjQpn0z5C6B8a05W+pMgTZ5jgBj6ZI+Z3mDxeQIQDu
 sEd67h5L/EkHoC/A=
X-Received: by 2002:a05:622a:4208:b0:3b6:2cdb:e240 with SMTP id
 cp8-20020a05622a420800b003b62cdbe240mr20084644qtb.18.1674206307602; 
 Fri, 20 Jan 2023 01:18:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmXjsCxHtMHgkyZ23rbzaoEnpjw8dR5IuDfVa9IRDeCAkPW+vuFXPd3VHIURjWF227LLpACQ==
X-Received: by 2002:a05:622a:4208:b0:3b6:2cdb:e240 with SMTP id
 cp8-20020a05622a420800b003b62cdbe240mr20084633qtb.18.1674206307395; 
 Fri, 20 Jan 2023 01:18:27 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 u2-20020a05620a0c4200b006f9f3c0c63csm26108202qki.32.2023.01.20.01.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 01:18:26 -0800 (PST)
Message-ID: <718784c3-43c5-b621-d5a0-a8aafa492a6e@redhat.com>
Date: Fri, 20 Jan 2023 10:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org
References: <20230120082341.59913-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 00/11] tests/qtest: Allow running boot-serial /
 migration with TCG disabled
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 20/01/2023 09.23, Philippe Mathieu-Daudé wrote:
> Missing review: #7
> 
> Two test were failing on Darwin when testing Fabiano's series
> which allows building ARM targets without TCG accelerator:
> https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/
> 
> These patches allow boot-serial / migration tests to run without
> TCG / KVM.

I just started reviewing while you were sending v3 ... please see my mails 
in reply to v2 for some comments.

Also, I don't quite understand why this is necessary. If you specify both, 
"-accel kvm -accel tcg" on the command line, QEMU should simply fall back to 
the second accelerator if the first one is not available? What's exactly the 
problem you are trying to solve here?

  Thomas


