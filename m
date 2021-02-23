Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0563227EF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:38:28 +0100 (CET)
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEU9D-0005p3-CW
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEU7f-0004hL-5N
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEU7c-0005m3-Eg
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614073007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHIGw04nGrl6p6r8qj5pbeIBZ+J0LkWzTHutFV69Yjk=;
 b=GwzIwij0yNin0QmWXcZfZoqtY3oGgivNgIjWaQLtDZhp47o/5JcTCwtHjyFbnsyk8H0MTw
 rqTE/afgzvSfWpam84KR17PfExFbzHBqMqOOQytwNcytry8kGeHWOL3SpuBIYSYjuOrM0G
 efsdB5spF+Q0kiA7a32fjqhCet/KFwM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-2zCZTsZUNbWajHXrk3affA-1; Tue, 23 Feb 2021 04:36:14 -0500
X-MC-Unique: 2zCZTsZUNbWajHXrk3affA-1
Received: by mail-wr1-f70.google.com with SMTP id p18so7137341wrt.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 01:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dHIGw04nGrl6p6r8qj5pbeIBZ+J0LkWzTHutFV69Yjk=;
 b=PSnR0o8PXANqy3ncfrUoTTQEkA9yuZrHyyidSREqI46GX5CytNa8lmqQc8W04JVxX2
 tZL5Zm1ARPPF9MXLMID9ECZQrOKTyNIdM3yqgcMBXYSmMda3bClJxs96vjLGPKreOij3
 FHpN9ju34yqvkxTUjgU1WOblS51dVNR6gPYfiIWg06SV46u/anlqZ/LQca8J0QeCKH7N
 38BKAPLiiwN1k364fK/snA1P4R4ZzSLIIT6GtlfYx9qwnw0Gb7dBPbuXmeiCUyHwnmhk
 p84D3vcJ9kv7RwKhN7tPfVCuj+KzD5rkFuIp0bMUNpmnAhu3Kn5YYQZYIaMeo7tlUoLe
 pzsQ==
X-Gm-Message-State: AOAM533oO+ie5VcnkeDQ9/toyb4Za3LE3Soq2UAnddov/VV4zcRaE7h6
 lcuJOmVzS4Zzxiknt+v5QeAzTE2N0VupTaHcOIBKin1ytetcRg2TFDuSKqUAuxumDkTjYM9y2p7
 7XfCJDlNSrAYyecE=
X-Received: by 2002:adf:9f54:: with SMTP id f20mr25389261wrg.362.1614072973061; 
 Tue, 23 Feb 2021 01:36:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIrnMicy/wGSYHs/4Ou1FR3bHJ7rOHoEaA6nBJpIBQqgnghhdzc2ryzApmR4BH63LHdFgNrw==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr25389235wrg.362.1614072972867; 
 Tue, 23 Feb 2021 01:36:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p15sm4384840wrx.64.2021.02.23.01.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 01:36:12 -0800 (PST)
Subject: Re: romfile resize
To: Jiatong Shen <yshxxsjt715@gmail.com>, qemu-discuss@nongnu.org
References: <CALqm=df_dH41LQfG+X2_qL2z68DPAF9vT=9HGSEbBMWec_zLQA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ef18782e-99d8-8406-152f-46c03bbd3280@redhat.com>
Date: Tue, 23 Feb 2021 10:36:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CALqm=df_dH41LQfG+X2_qL2z68DPAF9vT=9HGSEbBMWec_zLQA@mail.gmail.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-devel@

On 2/23/21 1:45 AM, Jiatong Shen wrote:
> Hello,
> 
>   we are faced with an issue where a changed sized romfile
> (efi-virtio.rom) fails live migration. Do qemu load this rom from its
> current host only? If yes, why cannot sync this from source vm?
> 
> thank you.
> 
> -- 
> 
> Best Regards,
> 
> Jiatong Shen


