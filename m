Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED62C5F64
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 06:02:21 +0100 (CET)
Received: from localhost ([::1]:36296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiVtl-0003Wu-1O
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 00:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVrp-0002bb-B7
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 00:00:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVrn-0007v1-OZ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 00:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606453219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SERl120qnBI8qRjT7EAPMcyY4AzUe8JUM3l4WBf1rCo=;
 b=f/ECVZn0lBo7okvXQpvH+E/B7hX7Ch0Ae5eGePPgpBtY7AfMXnHfLIYCzkPYt/iq4uMbd1
 8nNKU1LM+TtTya5dgpiv7Bx48log9BRcdsdkcCMIKree0ePLpKepTYLznWQPU53M8r42KZ
 5mXEIobm2MCAmVmk/jgiKoTk8MkHpfI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-4E3epiRBMb-PBH5V7PUp_w-1; Fri, 27 Nov 2020 00:00:15 -0500
X-MC-Unique: 4E3epiRBMb-PBH5V7PUp_w-1
Received: by mail-ed1-f71.google.com with SMTP id b13so1995174edy.8
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 21:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SERl120qnBI8qRjT7EAPMcyY4AzUe8JUM3l4WBf1rCo=;
 b=UtOovHG6EmXchuRxDD8NIXapgYLNGLEtMDQsM6/LB4WoyPER3rW0WsxE7V4gqJ5Z/E
 DM4Cn1wxaQnwakun0Swk7m3UdYcEEqtM3P8Lcjg1RdXSTZHHNEM2hwpNnujlbjzYyok6
 wvjmgW8os5b1cy5x0XGPENSX0SlEGF61Mc7tm2PNiLkjMkm+L4tkXo1M4oYX6SnoBHJ/
 rNQGgqO2Wh9vgsda6nQMrlRstVAsAqZnJ817V78IOEQEIlS2OfLWTh2JNGBXyCbZaLFk
 Clz6fkj1cnSEVsYGaWR4NIYoxTHGNUObQrjoMXoR72z7R6/tMTnyXPAUytDzu4+xJIW7
 +yYQ==
X-Gm-Message-State: AOAM5314TpWFQqrBuiHK0f9CYZYde8bHG+wfIMj5nzY//b5dxruDxDXh
 4o7GI4MJgmyh7irqyW1xWpFNOcd9ikwk15dT7TmrgSYh/ajPr8qbGHQAwa0rK14zRRxO55J2UM/
 09eUeyCa2i6a1KPg=
X-Received: by 2002:a17:906:b255:: with SMTP id
 ce21mr5605329ejb.137.1606453214688; 
 Thu, 26 Nov 2020 21:00:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIElMjfa3qlm3n+Mx1YIbCtFfdPqx0h4ONsfueHaeCYmDfN7tOiIIuL4cPpUX5Bg/39YTo3w==
X-Received: by 2002:a17:906:b255:: with SMTP id
 ce21mr5605314ejb.137.1606453214540; 
 Thu, 26 Nov 2020 21:00:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id q19sm4204544ejz.90.2020.11.26.21.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 21:00:13 -0800 (PST)
Subject: Re: [PATCH v2 2/6] accel: accel_available() function
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-3-ehabkost@redhat.com>
 <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
 <20201126133645.GG2271382@habkost.net>
 <8d90d611-6545-a478-1316-542dc5424b92@suse.de>
 <f4f64154-9fbb-36fa-d9cb-e49c8ed06537@redhat.com>
 <7df7713c-5125-9e41-3572-a476cad2946b@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <485d0953-1a34-6d02-0386-adab7ee3b1c1@redhat.com>
Date: Fri, 27 Nov 2020 06:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7df7713c-5125-9e41-3572-a476cad2946b@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/20 22:06, Claudio Fontana wrote:
>> I think it's just that the usecase is not that common.  "Is this
>> accelerator compiled in the binary" is not something you need after
>> startup (or if querying the monitor).
>
> A script that repeatedly uses the QMP interface to query for the status could generate fragmentation this way I think.

System malloc should be smarter than that, but anyway this is all but 
the only allocation in that path.

Paolo


