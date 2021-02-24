Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56D32400C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:23:50 +0100 (CET)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEw0z-0001PV-7C
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEvyw-0000G4-Vv
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:21:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEvyv-00026z-9I
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614180100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+EeR9dlD6sCdrgE0f5NlJh1hKyLURkHFD5DlPOhOaEA=;
 b=fjOnu8MsuvtTU7LvoEysLHJ3kCSfqgISfQFMvuStLEIidjl2SAtex3pwOwaM/X2+rAapSe
 QsQ1vsq3oFv1EA/Q5HbgjN3dYZzr0MvCD6Aubk7xSQEp4UNM6q7SHPNJFYMOpwCm2NWCAE
 8eb8LFqRHChlCaz75N35VPvy+EtNhJo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-uwa-ETauO0in5swtMrtdZw-1; Wed, 24 Feb 2021 10:21:17 -0500
X-MC-Unique: uwa-ETauO0in5swtMrtdZw-1
Received: by mail-wm1-f69.google.com with SMTP id o18so295933wmq.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 07:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+EeR9dlD6sCdrgE0f5NlJh1hKyLURkHFD5DlPOhOaEA=;
 b=M0H/Kqf5eo6BXqwJDj59yslD3kMvmzXIRGdvKitkx5oHUWlCVoGaTcNIRHf9zsfZp5
 mE44kEP6J196J5WaI6B1XXXgKzjjlh5dstLDlJthH/8+ajhdAeygJ2iUBwZnh3sjow4I
 VZk2aHDad9HK89o7t07hA0cgP0fLC/e4JJl2SzMSHP4N50Xg5NFX+v7F4pnx0BOxoK+H
 S4hy3hRhA3w8k8vjDlRf9YDVDl0bZZLCeNakfq+BHWuP1w0o6yKWwMGMK2daY4j+yQLG
 Fjxus6f5HA53+N6R6XRZgVRnCWSBnDZHgzOZgtWuOlqXmiRWWKXUZu3p6yRi+lhfDKDH
 uPPQ==
X-Gm-Message-State: AOAM531flUTQDbDd+HiHJz7DeBJMED2dp+5Tx2C5nTPJj2v3g9B1RFCH
 EFSUGC6K8zV3uwJEJZRM8Pi9l30aRxR77x377i0XKeXbP+pF+8d1hHA29bHAKDgw2LaPhekSq2n
 /v2iTVnwNTWrCnu8=
X-Received: by 2002:adf:b313:: with SMTP id j19mr8707557wrd.188.1614180076204; 
 Wed, 24 Feb 2021 07:21:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3LoCbWkkeSrpSHCHVyPXZiZWHPvhaHmdIRvQmlf9op6R+LZvSXrAF/3rSn1XiohBwnHcnaA==
X-Received: by 2002:adf:b313:: with SMTP id j19mr8707511wrd.188.1614180075921; 
 Wed, 24 Feb 2021 07:21:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n9sm3654267wmi.43.2021.02.24.07.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 07:21:15 -0800 (PST)
Subject: Re: [PATCH 00/14] deprecations: remove many old deprecations
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <CAFEAcA-Dvdg3L8rZT=yxjct-EkYcUzWAu2AZY67dKO6cRcvXzA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0beb85a8-500e-4c12-2f94-5bdb85edf984@redhat.com>
Date: Wed, 24 Feb 2021 16:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Dvdg3L8rZT=yxjct-EkYcUzWAu2AZY67dKO6cRcvXzA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Libvirt <libvir-list@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 3:38 PM, Peter Maydell wrote:
> On Wed, 24 Feb 2021 at 13:21, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> The following features have been deprecated for well over the 2
>> release cycle we promise
>>
>>   ``-usbdevice`` (since 2.10.0)
>>   ``-drive file=3Djson:{...{'driver':'file'}}`` (since 3.0)
>>   ``-vnc acl`` (since 4.0.0)
>>   ``-mon ...,control=3Dreadline,pretty=3Don|off`` (since 4.1)
> 
> Are the literal '=3D' here intended ?

No, this is a git-publish bug:
https://github.com/stefanha/git-publish/issues/88

Apparently the fix is not yet backported to Fedora.


