Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AF2F5CED
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:09:01 +0100 (CET)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzycl-0005lB-Ug
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kzybV-000561-Hl
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:07:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:43364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kzybT-0005g4-Rk
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:07:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42491AFBF;
 Thu, 14 Jan 2021 09:07:37 +0000 (UTC)
Subject: Re: [PATCH] utils/fifo8: change fatal errors from abort() to assert()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20210114083329.10494-1-mark.cave-ayland@ilande.co.uk>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c1190557-8959-3c41-ae53-72504243f109@suse.de>
Date: Thu, 14 Jan 2021 10:07:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210114083329.10494-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/14/21 9:33 AM, Mark Cave-Ayland wrote:
> Developer errors are better represented with assert() rather than abort().

... "also, make the tests more strict"

I'd add this since the checks have been changed sometimes in the patch to be more strict.

Reviewed-by: Claudio Fontana <cfontana@suse.de>

> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> This was suggested by Peter during a discussion on IRC yesterday.
> 
> ---
>  util/fifo8.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/util/fifo8.c b/util/fifo8.c
> index a5dd789ce5..d4d1c135e0 100644
> --- a/util/fifo8.c
> +++ b/util/fifo8.c
> @@ -31,9 +31,7 @@ void fifo8_destroy(Fifo8 *fifo)
>  
>  void fifo8_push(Fifo8 *fifo, uint8_t data)
>  {
> -    if (fifo->num == fifo->capacity) {
> -        abort();
> -    }
> +    assert(fifo->num < fifo->capacity);
>      fifo->data[(fifo->head + fifo->num) % fifo->capacity] = data;
>      fifo->num++;
>  }
> @@ -42,9 +40,7 @@ void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num)
>  {
>      uint32_t start, avail;
>  
> -    if (fifo->num + num > fifo->capacity) {
> -        abort();
> -    }
> +    assert(fifo->num + num <= fifo->capacity);
>  
>      start = (fifo->head + fifo->num) % fifo->capacity;
>  
> @@ -63,9 +59,7 @@ uint8_t fifo8_pop(Fifo8 *fifo)
>  {
>      uint8_t ret;
>  
> -    if (fifo->num == 0) {
> -        abort();
> -    }
> +    assert(fifo->num > 0);
>      ret = fifo->data[fifo->head++];
>      fifo->head %= fifo->capacity;
>      fifo->num--;
> @@ -76,9 +70,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num)
>  {
>      uint8_t *ret;
>  
> -    if (max == 0 || max > fifo->num) {
> -        abort();
> -    }
> +    assert(max > 0 && max <= fifo->num);
>      *num = MIN(fifo->capacity - fifo->head, max);
>      ret = &fifo->data[fifo->head];
>      fifo->head += *num;
> 


