Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DFE68D595
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMDw-0007qo-Sc; Tue, 07 Feb 2023 06:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMDu-0007p7-HQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMDq-0002Ui-Mi
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t0TwAyeMBbYXiR5w1NqLGen1Wk3+k5XKycQgdVGpZIw=;
 b=famuqRNyvpxke3wUNT8PCaDfsN7PX1wvQZvdegJTVczXit8jhdKbD8uDCiYT+JEVg5+d1a
 O4hJLPEpHPYxUZq8ACsxtwQmBn+L15/GIua0863o+fNlHMmoCIrczJOoDtn1hhphTaB36T
 RCK5cyNJk6fKeKvrKU/wVdBzwxODB1U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-NldPQQ2PN-2zttcH4-P0Pg-1; Tue, 07 Feb 2023 06:33:12 -0500
X-MC-Unique: NldPQQ2PN-2zttcH4-P0Pg-1
Received: by mail-ej1-f69.google.com with SMTP id
 p16-20020a170906499000b0088c5a527c89so10967436eju.23
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t0TwAyeMBbYXiR5w1NqLGen1Wk3+k5XKycQgdVGpZIw=;
 b=JyYZdsIA7yPGb4zIfs01iEG4CkeAbNgB/Txz1xGB4scmmKBVQ3vajh/2LpSE94Pfq7
 2lkLlWmyBz6tZSW3hUf+LVmEDu/7RVskti1k9R/9uWv+dg7kdpoh+8bEVtxD7vW7hpYD
 Fj35oa8+nVk3tzYfXKbh2Z7ZNzeCkAo/y+IwcNFK3/8t6GkzHUliLXFkoBV1Kzdi2hkE
 0CZlo6P59h//8fd/L/nb4xotScZ4j1BBbFgbnW+WRCM6n4v2dGB4yJTUz7hXqGVLfpgO
 y7ZxD2DdpDJiTnna1iDR1C26NsVTrb/1t1DiVktU3gS8sMlp6rDNWEeFjZE5rsrXGX2n
 j9QQ==
X-Gm-Message-State: AO0yUKXjRx+SQGlfOzFtnO4TFaei0I7NZ5n/ciR0R/40VKOHc5ZXF1c/
 Uq9bKmurijLif6QY6rjl1IERy/AdsGqWBAHP3lId+AyGO+72D2+LStWgDwcUiMKCSbjDJPv2viv
 lTZrGMueggAMUfTSqGDWAhp0Stxv+ruU/Km9m90Ey1ics3ubIPCqrJJWc+YWL3aSm+F5dELzn
X-Received: by 2002:a17:906:eb8b:b0:878:5d34:3c41 with SMTP id
 mh11-20020a170906eb8b00b008785d343c41mr2859395ejb.71.1675769590795; 
 Tue, 07 Feb 2023 03:33:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8r3uozHCtEi/LMVMiCmjIxiOKhngWAEo9G7lJPlxJhU8/cv+TnzoavMwd5Qu+/1txfKr6wDg==
X-Received: by 2002:a17:906:eb8b:b0:878:5d34:3c41 with SMTP id
 mh11-20020a170906eb8b00b008785d343c41mr2859372ejb.71.1675769590339; 
 Tue, 07 Feb 2023 03:33:10 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ha4-20020a170906a88400b0088744fc7084sm6762523ejb.38.2023.02.07.03.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:33:09 -0800 (PST)
Message-ID: <adcff5a2-5ad0-d9b7-87e2-4c0705023e0f@redhat.com>
Date: Tue, 7 Feb 2023 12:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>, qemu-users@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: PSA: git:// access to git.qemu.org has been shut down
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The only way to access git.qemu.org is now via HTTPS at either 
https://gitlab.com/qemu-project/qemu or https://git.qemu.org/qemu.git.

Paolo


