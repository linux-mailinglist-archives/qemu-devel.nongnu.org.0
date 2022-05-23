Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6A053119E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:33:41 +0200 (CEST)
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntA3w-0007Yz-Fz
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1ntA1L-0004nG-Fv
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:30:59 -0400
Received: from mail1.hostfission.com ([118.127.8.195]:33894)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1ntA1J-00046I-C4
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:30:58 -0400
Received: from www1.hostfission.com (www1.hostfission.com [118.127.8.179])
 by mail1.hostfission.com (Postfix) with ESMTP id 2E1F31E017B;
 Tue, 24 May 2022 01:30:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1653319854;
 bh=qYTodPFrWlHu+GISc0LqRYx2mTTnKxSWP+tiwPvbwCw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dRiaMN1oqtqz6gaIY//t86kbRFgntuEwJTdxYb7wR/seA1eVkImEEnjcidRdHaygl
 AWqgbf1OTkYqYwcqAZpE5pWMoKqZZ8WfHIKniickSoIZ03n+HHUrysopTUTK4aEzbH
 +4rhLr9GiraHcPZNYT3KZYBHdxi5tKCgSJTbGopg=
Received: from mail.hostfission.com (www1.hostfission.com [127.0.0.1])
 by www1.hostfission.com (Postfix) with ESMTP id 50C0228FCC;
 Tue, 24 May 2022 01:30:53 +1000 (AEST)
MIME-Version: 1.0
Date: Tue, 24 May 2022 01:30:53 +1000
From: Geoffrey McRae <geoff@hostfission.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Windows QXL Display Driver
In-Reply-To: <20220523152830.3n6xnletrexmvjiq@sirius.home.kraxel.org>
References: <0c317d39fa81e000a1b7717ab4fde75d@hostfission.com>
 <20220523152830.3n6xnletrexmvjiq@sirius.home.kraxel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a37e1ce967acf5a67188eab601d17edf@hostfission.com>
X-Sender: geoff@hostfission.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=118.127.8.195; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022-05-24 01:28, Gerd Hoffmann wrote:
> On Tue, May 24, 2022 at 12:35:49AM +1000, Geoffrey McRae wrote:
>> Hi Gerd,
>> 
>> Over the past few weeks I have been adding spice display support to 
>> Looking
>> Glass as a fallback mechanism for during system boot (or diags) before 
>> our
>> application is loaded in the guest VM. The idea is to have the VFIO 
>> GPU
>> duplicate it's output to the QXL device, which works fine until you 
>> load the
>> QXL display driver.
>> 
>> The issue is that once the driver is loaded windows removes the option 
>> to
>> duplicate the output.
> 
> Just don't load the driver then?  Or use stdvga instead?  Shouldn't 
> make
> a big difference performance-wise given that qxl supports 2d accel only
> which is pretty much dead these days.

This is what we will advise people but if possible we would like to 
avoid doing so as we know we are going to get people insisting on 
installing the driver anyway. We are basically trying to make this work 
in a way that we don't have to deal with a lot of support issues.

> 
>> Is this something that needs to be tweaked in the
>> driver to allow this? or is there a technical reason why this can't be 
>> done?
> 
> I don't have much insight into the inner workings of the qxl windows
> driver, sorry.

No worries, thanks for your time.

> 
> take care,
>   Gerd

