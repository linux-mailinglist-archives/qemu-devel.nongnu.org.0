Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82CC6753D1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 12:50:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIpsy-0002kq-OF; Fri, 20 Jan 2023 06:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIpsw-0002jw-DE
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:48:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIpsu-0008W3-PT
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674215319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhkBgHAuK35g5bcK3lRDSW7p6p0MF0rwXGLB8aVNL6w=;
 b=LLwSaOeNmUQ0pMvn0DpnR98gorEKQEtBUsdPmpnNDQJoJ1gLfJeRytsOSlXY+AGlzGWbtO
 1E7O1cYm79NnmueINku6an01b6IG3/kUE5jj6K2ggEUX7UiQb8k/eSHKr9M+34ENxDLiGq
 mXwSVGQcmuOh80aixdIkFYoWVyHFOyA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-wvl2RXe4MmOmx8SzVkEQoQ-1; Fri, 20 Jan 2023 06:48:36 -0500
X-MC-Unique: wvl2RXe4MmOmx8SzVkEQoQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso3328832qkp.20
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 03:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhkBgHAuK35g5bcK3lRDSW7p6p0MF0rwXGLB8aVNL6w=;
 b=5gXCVZK0bZQSJdEw1jihzyY3/cX/Zg+4s4A8iIe+NUSVhV2AivWbrnDYVH2vwdIvW1
 TsJLRTA9muUwEv8bK2IQRQvlNPOi/Rp6BoAPrkoSBUaInpilfWaO5MaVgjbNEx8B4/JK
 oX09WwN+lCpjm2IyW4eXmCmZKY+Sq+BSM8X567McNCluL+21jQL40uRgTSM5W3zoprFo
 nWH3M0YCKXK8B6zvij/2QektUuocyd78hChvgNdZ0Q9AcLU9+TlLjfHiW1YBqzps4uIJ
 srOhPOjXxGBouh/VECVQehUpRlFxmSxmu+FghFcq1D3AoJy40HTrlj04Xj7kNPf0k2Y0
 bw0A==
X-Gm-Message-State: AFqh2kotyc0VsB/fvntBP2kk6jyx10s6KvX4yZCbVdlYtfPZWw0Sc2fu
 1g/hDROOpjHjrXwPivoBDpHurQhihix2vJg3TUj7+JRTlleiVplr4gihKYHR2dxxsUIDYuOrdah
 MtTqIb39MQbUKfYY=
X-Received: by 2002:a0c:8dc9:0:b0:534:fe24:db68 with SMTP id
 u9-20020a0c8dc9000000b00534fe24db68mr20566632qvb.4.1674215315914; 
 Fri, 20 Jan 2023 03:48:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtNgWpI0Te5B8JvSEvbIVVqbak26FW8G6NYI+Hr+nDTy10Dq3e1gGuRJJa6s2HTqxQVQ4qUVQ==
X-Received: by 2002:a0c:8dc9:0:b0:534:fe24:db68 with SMTP id
 u9-20020a0c8dc9000000b00534fe24db68mr20566610qvb.4.1674215315709; 
 Fri, 20 Jan 2023 03:48:35 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05620a294f00b0070383f1b6f1sm26433301qkp.31.2023.01.20.03.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 03:48:35 -0800 (PST)
Message-ID: <20717e57-8524-5bca-efc3-ff294cda34f6@redhat.com>
Date: Fri, 20 Jan 2023 12:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-7-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119135424.5417-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19/01/2023 14.54, Fabiano Rosas wrote:
> QEMU machines might not have a default value defined for the -cpu
> option.

Which machines for example? ... I thought we'd have a default CPU everywhere?

  Thomas


