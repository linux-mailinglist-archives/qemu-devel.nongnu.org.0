Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1E24196B8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:50:11 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrxK-0000Ja-Oh
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrqd-0002D1-Oc
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrqW-0005Ah-Mw
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632753788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1chlyv82ica17V9KQ4//H7pkfU+nrINiz7Es8QRSs8=;
 b=ZfQrqHkuZYpNLQMKVsOYyLnna3HKF0NjMrgKUOUTxowvBW7EZJMfdo89IkXDOq3yKIcpK0
 5GaOO3RY60lUJqIhqUDlEIZVcNqdMLYNZq5OhEx7ey3FE9OhFdzTPMG88wutOXCeIdQS14
 0MvvdyzT6R9J43Myxm4nZTSjWlGh5Z0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-OVPwZlMIOCWyZv-T8Z3Tvw-1; Mon, 27 Sep 2021 10:43:04 -0400
X-MC-Unique: OVPwZlMIOCWyZv-T8Z3Tvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so329524wmc.2
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d1chlyv82ica17V9KQ4//H7pkfU+nrINiz7Es8QRSs8=;
 b=Ct7szx5kUq8MYBqRpZJYA6ShujMAiZwtvJgfFPcTL/RytA56saQV9wc5abotS72Wyt
 Wyf0DTiQI7Ym4HIyF/pOEYX9OrmIKPgixgHVuLxxY8Nr+mpOPKtdKwtWuIwGjV/rQgQ0
 4z5QYkQecHdOytLkqthPimGUQ7yiVHjhKFMO6slauOQT/K4OJ/G7wdko9fg9HrjzCOiL
 BysrtsD/9Z8cQJdEhUzpHuTjwkz2WBMcmdlyKLkopWAEx5ASRy5gfd4O5cVq0zR2rmpS
 en73yWcbvrjzd3XLHbnR7v9X64OUaS1CF26nwCW72EdVo/QRFjsgzmo9cC7vEhepb0Xm
 IjOA==
X-Gm-Message-State: AOAM5332lVsWmCdUcRCaBlYZlXy7I7KrifM0NfsjJqjT2tPo3XIKbcot
 fU7tPrgr5oSYjBn2EHWxIcL75S4G4+f1an2azbq/hLKTc5mstlxhfZvYv/cg9qatPR1Zn03GZs2
 4jmWDqsn3f4PxnNE=
X-Received: by 2002:a05:600c:3646:: with SMTP id
 y6mr3511760wmq.61.1632753783812; 
 Mon, 27 Sep 2021 07:43:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZmlX1WxW9aWLQrpfrURM7NuuPW4QLxvV5FCqG46RD1Gji/aFM6fCuOdS4/IyjXZT4sBDKfA==
X-Received: by 2002:a05:600c:3646:: with SMTP id
 y6mr3511723wmq.61.1632753783619; 
 Mon, 27 Sep 2021 07:43:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z79sm17703753wmc.17.2021.09.27.07.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:43:03 -0700 (PDT)
Message-ID: <d521e193-7b2d-3ce1-28ae-7f4d26cd4072@redhat.com>
Date: Mon, 27 Sep 2021 16:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 12/16] tests/acceptance/boot_xen.py: removed unused import
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-13-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924185506.2542588-13-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 20:55, Cleber Rosa wrote:
> Just a clean up for an unused import.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_xen.py | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


