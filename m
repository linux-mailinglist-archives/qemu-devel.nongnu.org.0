Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24931BA73
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:37:36 +0100 (CET)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBe4F-00079Z-HB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBdxy-0001E6-MP
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBdxt-00033S-6q
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613395860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVOBjghGKM7+a/DmFvWxA3Q1PY3Zf5Pp7vnWB7x7qqA=;
 b=KYqISCmb4HC6K00Ratj2NZ/GVFL9JHUwgZ1kOFflqB5DpTIMHwXkam3u/9sMI921lFBvOU
 UogkqZ9YQQEBq3bOjVyUzjVVAJdheJ4N/tp0pIbZiMwcY9Kvw1iTs1C5zRB4NlZZ3DA2b+
 itRBWfpbOll770mlJiymgbCWKz51GdA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-1U-QAu__OBOvWKShEFINyA-1; Mon, 15 Feb 2021 08:30:58 -0500
X-MC-Unique: 1U-QAu__OBOvWKShEFINyA-1
Received: by mail-wm1-f70.google.com with SMTP id i4so5868458wmb.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DVOBjghGKM7+a/DmFvWxA3Q1PY3Zf5Pp7vnWB7x7qqA=;
 b=FZzGd6dBv6njYuHDGWKhDChJuUukh8+SPnJw0wptxq4iuOxIlpRapkOuDoSyz9Ujyc
 i13cF7l03xKVkfWX3/xtpavf435lnWhs0lJMp5hgWaoRnIaJ29KmNyDznHHh59QSZ0be
 KVhqAUCsbbNssqzXUPIx9Jp4Z8hg4iigebJzmkca4ubEUOm6LOIPya6MSMkfkjWqxlXk
 PpQKxP+4GIh+YigIISSk4FQvRLdl8tWIyjiIhZeSd6wktH+5Y3FXnTBBbUZ+7KqxhW9U
 yJu3Oq0cd+Mc+E4WIOkp2Bmd7k42fQnpFCyIJtf7OHH8n4pvlhGOWi2F4zrarxuzQRMU
 U4kw==
X-Gm-Message-State: AOAM532wdxxi3JT4YW577s40+SVABAg62RtLdw8WKgiJ16WiyvVPYLFX
 TUgCenjRXG1o+QtPPAGVRIuw9E9PU6DrC24aLhsJm2CsiTHkNTR7zPa1cP8zqUtBEtJAGRu+ie4
 uuYaeLO05Ljpm7OPmVri2ft8pe964V79eMAN609PVRH6F98hdFmTj7KF9+x00st5m
X-Received: by 2002:a5d:4982:: with SMTP id r2mr19449500wrq.41.1613395857189; 
 Mon, 15 Feb 2021 05:30:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1w+9PaDGwpK5kcx2nL9c9ItZ7qEgAHHvL2O6NfcsA9VotLl+XotySbi5Xz6UtxQohW4+SCA==
X-Received: by 2002:a5d:4982:: with SMTP id r2mr19449481wrq.41.1613395856922; 
 Mon, 15 Feb 2021 05:30:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a84sm25678738wme.12.2021.02.15.05.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 05:30:56 -0800 (PST)
Subject: Re: [PULL 00/19] i386, qgraph patches for 2020-02-15
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210215131626.65640-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <293b0540-d574-9528-bd58-91c97561db28@redhat.com>
Date: Mon, 15 Feb 2021 14:30:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 2:16 PM, Paolo Bonzini wrote:
> The following changes since commit 41d306ec7d9885752fec434904df08b9c1aa3add:
> 
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-02-09 10:04:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to bf98b5857a101f9032377044c250ab728464bcb0:
> 
>   hvf: Fetch cr4 before evaluating CPUID(1) (2021-02-09 18:47:45 +0100)
> 
> ----------------------------------------------------------------
> * HVF fixes
> * Extra qos-test debugging output (Christian)
> * SEV secret address autodetection (James)
> * SEV-ES support (Thomas)
> * Relocatable paths bugfix (Stefan)
> 
> ----------------------------------------------------------------
...

> qemu_oss--- via (5):
>       libqos/qgraph: add qos_node_create_driver_named()
>       libqos/qgraph_internal: add qos_printf() and qos_printf_literal()
>       tests/qtest/qos-test: dump qos graph if verbose
>       tests/qtest/qos-test: dump environment variables if verbose
>       tests/qtest/qos-test: dump QEMU command if verbose

For these patches the author is Christian Schoenebeck.


