Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A295A30C62D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:42:52 +0100 (CET)
Received: from localhost ([::1]:34860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ylP-00086J-Ox
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6yU3-0008Vb-CU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6yU0-0006gy-2W
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbmfK8U/PftvakzOWxOgB00W2LjubQ1Y7JqHLtDC+gE=;
 b=dyuCdJUCGS1VNnyGUMMS+yZMS7Ev6+NaEDnhJY/RWFisqY4GaHPgaLTf7wj4CLG62Nvl3g
 SqylXv1nLKmCOJKEMf0MWrhJUgfC8mZFAEnWDB+OZw3qRZUQebM456XijOwniTh40J1SLC
 TFK2O3UHqPy2ULu2xuHQX7fAbd4qZ+0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-x1MYYqeRMrS-nOkKQikItA-1; Tue, 02 Feb 2021 11:24:47 -0500
X-MC-Unique: x1MYYqeRMrS-nOkKQikItA-1
Received: by mail-wr1-f72.google.com with SMTP id l13so12794106wrq.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZbmfK8U/PftvakzOWxOgB00W2LjubQ1Y7JqHLtDC+gE=;
 b=C52hiDceM1/qM8i8cNrTyGFhB/rIPVnS15LL7gojrmzdyddw/xU57wKQ0N+pNtA4XE
 LfdmEvwzZP1GXTKFXP8azjt0dUVT3aqaOpg23fc7cZy0PbYu2JVPmR5AtC9g26YbqMXg
 TuWRh29+sJla3kmAc7JSxXHIgUWXDAdnUx9WKYXQEsyOLYgCEQpYq48T7Ph6zkZsTq7p
 CmwAgP2/lrR8adgOlnlPU+29lVEcnUifDh3IinoRIjn5GtbtMJI6P7mwSB0a342nAVMj
 r/7NAj7QEqOISTb4G7CIAEL2iz15hJYj8tsxyR44v/YY7457MqceCmaXCJ67E0MZP5FK
 w39w==
X-Gm-Message-State: AOAM530X4KMPLuQb2QywhKLOTPCv0QocqVhUE3LDev9AGlAF9hJ2wWif
 o9DCtfwXwX+dpN9+aZLMX1QJIEGoG/2lseWE+DV32ARmm3/DZWb3YnIfmXzyJexIftu7KQr7tPo
 F/46WcrSKMsQ4qEA=
X-Received: by 2002:a5d:5910:: with SMTP id v16mr25430041wrd.29.1612283086191; 
 Tue, 02 Feb 2021 08:24:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1BANfVKO3sT9j9JGDxsJ15Dy1ykimF1VFnvtRUNnbvI3vMO8YeC21lsdD04g1ghOOV8STZg==
X-Received: by 2002:a5d:5910:: with SMTP id v16mr25430015wrd.29.1612283086018; 
 Tue, 02 Feb 2021 08:24:46 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u10sm3769792wmj.40.2021.02.02.08.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:24:45 -0800 (PST)
Subject: Re: [PATCH v10 11/12] iotests: fix loading of common.config from
 tests/ subdir
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210202154138.246464-1-berrange@redhat.com>
 <20210202154138.246464-12-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5dd20bcc-2eee-45bb-6fb7-f9e22262fc23@redhat.com>
Date: Tue, 2 Feb 2021 17:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202154138.246464-12-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 4:41 PM, Daniel P. Berrangé wrote:
> common.rc assumes it is being sourced from the same directory and
> so also tries to source common.config from the current working
> directory. With the ability to now have named tests in the tests/
> subdir we need to check two locations for common.config.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qemu-iotests/common.rc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


