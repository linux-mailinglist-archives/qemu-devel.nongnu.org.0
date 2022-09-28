Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239AF5ED9EA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:16:29 +0200 (CEST)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odU79-0002le-U4
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odSQH-0007xo-55
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odSPz-0001R9-Td
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664353664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7BsiJ3TzmOvVg3TtMyqHrtvSQqU1CDotqYHG4WcAtTA=;
 b=U9ge5xKzl9MkEt9x7tD8runFkkb0bM0ulHThA+03+EqPBQec+Ej/fkJm4Sf/9JfKg98U+/
 5N2Dft1vWofSlesO5lTkx/eJ1gcG9OaUOn0bJsE+i8jbufu/DufdMhEJmzUE00zwp3xcqM
 sJZxswPdRXChj9O+89v+NqXPpKZj5kw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-IEWrukPnNtOismLrpXqJGw-1; Wed, 28 Sep 2022 04:27:42 -0400
X-MC-Unique: IEWrukPnNtOismLrpXqJGw-1
Received: by mail-wm1-f72.google.com with SMTP id
 p36-20020a05600c1da400b003b4faefa2b9so6783735wms.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 01:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=7BsiJ3TzmOvVg3TtMyqHrtvSQqU1CDotqYHG4WcAtTA=;
 b=IBOlTwwidePc/j1v5L/RQ+ZjD5E5/tG3vXSjkuSK5J7A/LQ7PpYJSjB9CxIPCeawAM
 ANycnMg7GZz7BSFxTsZZY0E9loE+ipDYlejslv8RX8L/0+zg6prBsV1zb21LY/rPD+yz
 PTDTmS1hp463QWmqfBq8wLhK7MYNZRciwcP9bgnqZJyZ5rSOOtlr1TXEvMx78ZPVP7gV
 j44ic+sksLcJvd3VYH7CNvrs9/paZZs1kALqo8dH5bJVssAP+Z3+rwfjV6xMNHIM58Al
 AO1TnwHCM5fn3Y0Oo3ERnE9QuphHZ7cAnlJdsW0h0h/n7zMDAoPY/sUGbhHqagwMZRKi
 Bazg==
X-Gm-Message-State: ACrzQf1YgSKVN3h6Le1i8vV6PGRcyMP3J8+bv/G5xpYCLkFzdN1PAFDU
 iq+d714F/FWyxOHxFt9gTnnFGiqE80j/GlMkFlMFjzABsvF+/2O6NJYvU/urDnG0YXeElg2vxZT
 Z3uMVA6fqM957dC/3Ln55tYNDdOCDtudodOPSB7PoBhbFDe2PNITlGRNZhgt+ABc=
X-Received: by 2002:a5d:5642:0:b0:22a:845b:d6df with SMTP id
 j2-20020a5d5642000000b0022a845bd6dfmr19756660wrw.416.1664353661888; 
 Wed, 28 Sep 2022 01:27:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6VFclKiq9dkcsKT7idD+B2+pMdiGPpdmOJ8kg/hfMWurVSpOgk3mIPrjgBMtSy9huoOUFfVA==
X-Received: by 2002:a5d:5642:0:b0:22a:845b:d6df with SMTP id
 j2-20020a5d5642000000b0022a845bd6dfmr19756640wrw.416.1664353661589; 
 Wed, 28 Sep 2022 01:27:41 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b003b435c41103sm1561466wmb.0.2022.09.28.01.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 01:27:40 -0700 (PDT)
Message-ID: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
Date: Wed, 28 Sep 2022 10:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-discuss <qemu-discuss@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: If your networking is failing after updating to the latest git
 version of QEMU...
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


... it might have happened due to the removal of the "slirp" submodule from 
the git repository. For example if you see an error message like this:

  Parameter 'type' expects a netdev backend type

this likely means that the "user" mode backend type is not available in your 
binary anymore. To fix it, simply install "libslirp-devel" (or libslirp-dev 
or however it is called) from your OS distribution and recompile.

See also the commit message here:
  https://gitlab.com/qemu-project/qemu/-/commit/5890258aeeba303704

  Thomas


